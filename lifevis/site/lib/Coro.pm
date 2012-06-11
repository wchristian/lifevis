=head1 NAME

Coro - the only real threads in perl

=head1 SYNOPSIS

  use Coro;
  
  async {
     # some asynchronous thread of execution
     print "2\n";
     cede; # yield back to main
     print "4\n";
  };
  print "1\n";
  cede; # yield to coro
  print "3\n";
  cede; # and again
  
  # use locking
  my $lock = new Coro::Semaphore;
  my $locked;
  
  $lock->down;
  $locked = 1;
  $lock->up;

=head1 DESCRIPTION

For a tutorial-style introduction, please read the L<Coro::Intro>
manpage. This manpage mainly contains reference information.

This module collection manages continuations in general, most often in
the form of cooperative threads (also called coros, or simply "coro"
in the documentation). They are similar to kernel threads but don't (in
general) run in parallel at the same time even on SMP machines. The
specific flavor of thread offered by this module also guarantees you that
it will not switch between threads unless necessary, at easily-identified
points in your program, so locking and parallel access are rarely an
issue, making thread programming much safer and easier than using other
thread models.

Unlike the so-called "Perl threads" (which are not actually real threads
but only the windows process emulation (see section of same name for
more details) ported to UNIX, and as such act as processes), Coro
provides a full shared address space, which makes communication between
threads very easy. And coro threads are fast, too: disabling the Windows
process emulation code in your perl and using Coro can easily result in
a two to four times speed increase for your programs. A parallel matrix
multiplication benchmark (very communication-intensive) runs over 300
times faster on a single core than perls pseudo-threads on a quad core
using all four cores.

Coro achieves that by supporting multiple running interpreters that share
data, which is especially useful to code pseudo-parallel processes and
for event-based programming, such as multiple HTTP-GET requests running
concurrently. See L<Coro::AnyEvent> to learn more on how to integrate Coro
into an event-based environment.

In this module, a thread is defined as "callchain + lexical variables +
some package variables + C stack), that is, a thread has its own callchain,
its own set of lexicals and its own set of perls most important global
variables (see L<Coro::State> for more configuration and background info).

See also the C<SEE ALSO> section at the end of this document - the Coro
module family is quite large.

=head1 CORO THREAD LIFE CYCLE

During the long and exciting (or not) life of a coro thread, it goes
through a number of states:

=over 4

=item 1. Creation

The first thing in the life of a coro thread is it's creation -
obviously. The typical way to create a thread is to call the C<async
BLOCK> function:

   async {
      # thread code goes here
   };

You can also pass arguments, which are put in C<@_>:

   async {
      print $_[1]; # prints 2
   } 1, 2, 3;

This creates a new coro thread and puts it into the ready queue, meaning
it will run as soon as the CPU is free for it.

C<async> will return a Coro object - you can store this for future
reference or ignore it - a thread that is running, ready to run or waiting
for some event is alive on it's own.

Another way to create a thread is to call the C<new> constructor with a
code-reference:

   new Coro sub {
      # thread code goes here
   }, @optional_arguments;

This is quite similar to calling C<async>, but the important difference is
that the new thread is not put into the ready queue, so the thread will
not run until somebody puts it there. C<async> is, therefore, identical to
this sequence:

   my $coro = new Coro sub {
      # thread code goes here
   };
   $coro->ready;
   return $coro;

=item 2. Startup

When a new coro thread is created, only a copy of the code reference
and the arguments are stored, no extra memory for stacks and so on is
allocated, keeping the coro thread in a low-memory state.

Only when it actually starts executing will all the resources be finally
allocated.

The optional arguments specified at coro creation are available in C<@_>,
similar to function calls.

=item 3. Running / Blocking

A lot can happen after the coro thread has started running. Quite usually,
it will not run to the end in one go (because you could use a function
instead), but it will give up the CPU regularly because it waits for
external events.

As long as a coro thread runs, its Coro object is available in the global
variable C<$Coro::current>.

The low-level way to give up the CPU is to call the scheduler, which
selects a new coro thread to run:

   Coro::schedule;

Since running threads are not in the ready queue, calling the scheduler
without doing anything else will block the coro thread forever - you need
to arrange either for the coro to put woken up (readied) by some other
event or some other thread, or you can put it into the ready queue before
scheduling:

   # this is exactly what Coro::cede does
   $Coro::current->ready;
   Coro::schedule;

All the higher-level synchronisation methods (Coro::Semaphore,
Coro::rouse_*...) are actually implemented via C<< ->ready >> and C<<
Coro::schedule >>.

While the coro thread is running it also might get assigned a C-level
thread, or the C-level thread might be unassigned from it, as the Coro
runtime wishes. A C-level thread needs to be assigned when your perl
thread calls into some C-level function and that function in turn calls
perl and perl then wants to switch coroutines. This happens most often
when you run an event loop and block in the callback, or when perl
itself calls some function such as C<AUTOLOAD> or methods via the C<tie>
mechanism.

=item 4. Termination

Many threads actually terminate after some time. There are a number of
ways to terminate a coro thread, the simplest is returning from the
top-level code reference:

   async {
      # after returning from here, the coro thread is terminated
   };

   async {
      return if 0.5 <  rand; # terminate a little earlier, maybe
      print "got a chance to print this\n";
      # or here
   };

Any values returned from the coroutine can be recovered using C<< ->join
>>:

   my $coro = async {
      "hello, world\n" # return a string
   };

   my $hello_world = $coro->join;

   print $hello_world;

Another way to terminate is to call C<< Coro::terminate >>, which at any
subroutine call nesting level:

   async {
      Coro::terminate "return value 1", "return value 2";
   };

And yet another way is to C<< ->cancel >> (or C<< ->safe_cancel >>) the
coro thread from another thread:

   my $coro = async {
      exit 1;
   };

   $coro->cancel; # also accepts values for ->join to retrieve

Cancellation I<can> be dangerous - it's a bit like calling C<exit> without
actually exiting, and might leave C libraries and XS modules in a weird
state. Unlike other thread implementations, however, Coro is exceptionally
safe with regards to cancellation, as perl will always be in a consistent
state, and for those cases where you want to do truly marvellous things
with your coro while it is being cancelled - that is, make sure all
cleanup code is executed from the thread being cancelled - there is even a
C<< ->safe_cancel >> method.

So, cancelling a thread that runs in an XS event loop might not be the
best idea, but any other combination that deals with perl only (cancelling
when a thread is in a C<tie> method or an C<AUTOLOAD> for example) is
safe.

Lastly, a coro thread object that isn't referenced is C<< ->cancel >>'ed
automatically - just like other objects in Perl. This is not such a common
case, however - a running thread is referencedy b C<$Coro::current>, a
thread ready to run is referenced by the ready queue, a thread waiting
on a lock or semaphore is referenced by being in some wait list and so
on. But a thread that isn't in any of those queues gets cancelled:

   async {
      schedule; # cede to other coros, don't go into the ready queue
   };

   cede;
   # now the async above is destroyed, as it is not referenced by anything.

=item 5. Cleanup

Threads will allocate various resources. Most but not all will be returned
when a thread terminates, during clean-up.

Cleanup is quite similar to throwing an uncaught exception: perl will
work it's way up through all subroutine calls and blocks. On it's way, it
will release all C<my> variables, undo all C<local>'s and free any other
resources truly local to the thread.

So, a common way to free resources is to keep them referenced only by my
variables:

   async {
      my $big_cache = new Cache ...;
   };

If there are no other references, then the C<$big_cache> object will be
freed when the thread terminates, regardless of how it does so.

What it does C<NOT> do is unlock any Coro::Semaphores or similar
resources, but that's where the C<guard> methods come in handy:

   my $sem = new Coro::Semaphore;

   async {
      my $lock_guard = $sem->guard;
      # if we reutrn, or die or get cancelled, here,
      # then the semaphore will be "up"ed.
   };

The C<Guard::guard> function comes in handy for any custom cleanup you
might want to do (but you cannot switch to other coroutines form those
code blocks):

   async {
      my $window = new Gtk2::Window "toplevel";
      # The window will not be cleaned up automatically, even when $window
      # gets freed, so use a guard to ensure it's destruction
      # in case of an error:
      my $window_guard = Guard::guard { $window->destroy };

      # we are safe here
   };

Last not least, C<local> can often be handy, too, e.g. when temporarily
replacing the coro thread description:

   sub myfunction {
      local $Coro::current->{desc} = "inside myfunction(@_)";

      # if we return or die here, the description will be restored
   }

=item 6. Viva La Zombie Muerte

Even after a thread has terminated and cleaned up its resources, the Coro
object still is there and stores the return values of the thread.

The means the Coro object gets freed automatically when the thread has
terminated and cleaned up and there arenot other references.

If there are, the Coro object will stay around, and you can call C<<
->join >> as many times as you wish to retrieve the result values:

   async {
      print "hi\n";
      1
   };

   # run the async above, and free everything before returning
   # from Coro::cede:
   Coro::cede;

   {
      my $coro = async {
         print "hi\n";
         1
      };

      # run the async above, and clean up, but do not free the coro
      # object:
      Coro::cede;

      # optionally retrieve the result values
      my @results = $coro->join;

      # now $coro goes out of scope, and presumably gets freed
   };

=back

=cut

package Coro;

use common::sense;

use Carp ();

use Guard ();

use Coro::State;

use base qw(Coro::State Exporter);

our $idle;    # idle handler
our $main;    # main coro
our $current; # current coro

our $VERSION = 6.08;

our @EXPORT = qw(async async_pool cede schedule terminate current unblock_sub rouse_cb rouse_wait);
our %EXPORT_TAGS = (
      prio => [qw(PRIO_MAX PRIO_HIGH PRIO_NORMAL PRIO_LOW PRIO_IDLE PRIO_MIN)],
);
our @EXPORT_OK = (@{$EXPORT_TAGS{prio}}, qw(nready));

=head1 GLOBAL VARIABLES

=over 4

=item $Coro::main

This variable stores the Coro object that represents the main
program. While you cna C<ready> it and do most other things you can do to
coro, it is mainly useful to compare again C<$Coro::current>, to see
whether you are running in the main program or not.

=cut

# $main is now being initialised by Coro::State

=item $Coro::current

The Coro object representing the current coro (the last
coro that the Coro scheduler switched to). The initial value is
C<$Coro::main> (of course).

This variable is B<strictly> I<read-only>. You can take copies of the
value stored in it and use it as any other Coro object, but you must
not otherwise modify the variable itself.

=cut

sub current() { $current } # [DEPRECATED]

=item $Coro::idle

This variable is mainly useful to integrate Coro into event loops. It is
usually better to rely on L<Coro::AnyEvent> or L<Coro::EV>, as this is
pretty low-level functionality.

This variable stores a Coro object that is put into the ready queue when
there are no other ready threads (without invoking any ready hooks).

The default implementation dies with "FATAL: deadlock detected.", followed
by a thread listing, because the program has no other way to continue.

This hook is overwritten by modules such as C<Coro::EV> and
C<Coro::AnyEvent> to wait on an external event that hopefully wakes up a
coro so the scheduler can run it.

See L<Coro::EV> or L<Coro::AnyEvent> for examples of using this technique.

=cut

# ||= because other modules could have provided their own by now
$idle ||= new Coro sub {
   require Coro::Debug;
   die "FATAL: deadlock detected.\n"
       . Coro::Debug::ps_listing ();
};

# this coro is necessary because a coro
# cannot destroy itself.
our @destroy;
our $manager;

$manager = new Coro sub {
   while () {
      _destroy shift @destroy
         while @destroy;

      &schedule;
   }
};
$manager->{desc} = "[coro manager]";
$manager->prio (PRIO_MAX);

=back

=head1 SIMPLE CORO CREATION

=over 4

=item async { ... } [@args...]

Create a new coro and return its Coro object (usually
unused). The coro will be put into the ready queue, so
it will start running automatically on the next scheduler run.

The first argument is a codeblock/closure that should be executed in the
coro. When it returns argument returns the coro is automatically
terminated.

The remaining arguments are passed as arguments to the closure.

See the C<Coro::State::new> constructor for info about the coro
environment in which coro are executed.

Calling C<exit> in a coro will do the same as calling exit outside
the coro. Likewise, when the coro dies, the program will exit,
just as it would in the main program.

If you do not want that, you can provide a default C<die> handler, or
simply avoid dieing (by use of C<eval>).

Example: Create a new coro that just prints its arguments.

   async {
      print "@_\n";
   } 1,2,3,4;

=item async_pool { ... } [@args...]

Similar to C<async>, but uses a coro pool, so you should not call
terminate or join on it (although you are allowed to), and you get a
coro that might have executed other code already (which can be good
or bad :).

On the plus side, this function is about twice as fast as creating (and
destroying) a completely new coro, so if you need a lot of generic
coros in quick successsion, use C<async_pool>, not C<async>.

The code block is executed in an C<eval> context and a warning will be
issued in case of an exception instead of terminating the program, as
C<async> does. As the coro is being reused, stuff like C<on_destroy>
will not work in the expected way, unless you call terminate or cancel,
which somehow defeats the purpose of pooling (but is fine in the
exceptional case).

The priority will be reset to C<0> after each run, tracing will be
disabled, the description will be reset and the default output filehandle
gets restored, so you can change all these. Otherwise the coro will
be re-used "as-is": most notably if you change other per-coro global
stuff such as C<$/> you I<must needs> revert that change, which is most
simply done by using local as in: C<< local $/ >>.

The idle pool size is limited to C<8> idle coros (this can be
adjusted by changing $Coro::POOL_SIZE), but there can be as many non-idle
coros as required.

If you are concerned about pooled coros growing a lot because a
single C<async_pool> used a lot of stackspace you can e.g. C<async_pool
{ terminate }> once per second or so to slowly replenish the pool. In
addition to that, when the stacks used by a handler grows larger than 32kb
(adjustable via $Coro::POOL_RSS) it will also be destroyed.

=cut

our $POOL_SIZE = 8;
our $POOL_RSS  = 32 * 1024;
our @async_pool;

sub pool_handler {
   while () {
      eval {
         &{&_pool_handler} while 1;
      };

      warn $@ if $@;
   }
}

=back

=head1 STATIC METHODS

Static methods are actually functions that implicitly operate on the
current coro.

=over 4

=item schedule

Calls the scheduler. The scheduler will find the next coro that is
to be run from the ready queue and switches to it. The next coro
to be run is simply the one with the highest priority that is longest
in its ready queue. If there is no coro ready, it will call the
C<$Coro::idle> hook.

Please note that the current coro will I<not> be put into the ready
queue, so calling this function usually means you will never be called
again unless something else (e.g. an event handler) calls C<< ->ready >>,
thus waking you up.

This makes C<schedule> I<the> generic method to use to block the current
coro and wait for events: first you remember the current coro in
a variable, then arrange for some callback of yours to call C<< ->ready
>> on that once some event happens, and last you call C<schedule> to put
yourself to sleep. Note that a lot of things can wake your coro up,
so you need to check whether the event indeed happened, e.g. by storing the
status in a variable.

See B<HOW TO WAIT FOR A CALLBACK>, below, for some ways to wait for callbacks.

=item cede

"Cede" to other coros. This function puts the current coro into
the ready queue and calls C<schedule>, which has the effect of giving
up the current "timeslice" to other coros of the same or higher
priority. Once your coro gets its turn again it will automatically be
resumed.

This function is often called C<yield> in other languages.

=item Coro::cede_notself

Works like cede, but is not exported by default and will cede to I<any>
coro, regardless of priority. This is useful sometimes to ensure
progress is made.

=item terminate [arg...]

Terminates the current coro with the given status values (see
L<cancel>). The values will not be copied, but referenced directly.

=item Coro::on_enter BLOCK, Coro::on_leave BLOCK

These function install enter and leave winders in the current scope. The
enter block will be executed when on_enter is called and whenever the
current coro is re-entered by the scheduler, while the leave block is
executed whenever the current coro is blocked by the scheduler, and
also when the containing scope is exited (by whatever means, be it exit,
die, last etc.).

I<Neither invoking the scheduler, nor exceptions, are allowed within those
BLOCKs>. That means: do not even think about calling C<die> without an
eval, and do not even think of entering the scheduler in any way.

Since both BLOCKs are tied to the current scope, they will automatically
be removed when the current scope exits.

These functions implement the same concept as C<dynamic-wind> in scheme
does, and are useful when you want to localise some resource to a specific
coro.

They slow down thread switching considerably for coros that use them
(about 40% for a BLOCK with a single assignment, so thread switching is
still reasonably fast if the handlers are fast).

These functions are best understood by an example: The following function
will change the current timezone to "Antarctica/South_Pole", which
requires a call to C<tzset>, but by using C<on_enter> and C<on_leave>,
which remember/change the current timezone and restore the previous
value, respectively, the timezone is only changed for the coro that
installed those handlers.

   use POSIX qw(tzset);

   async {
      my $old_tz; # store outside TZ value here

      Coro::on_enter {
         $old_tz = $ENV{TZ}; # remember the old value

         $ENV{TZ} = "Antarctica/South_Pole";
         tzset; # enable new value
      };

      Coro::on_leave {
         $ENV{TZ} = $old_tz;
         tzset; # restore old value
      };

      # at this place, the timezone is Antarctica/South_Pole,
      # without disturbing the TZ of any other coro.
   };

This can be used to localise about any resource (locale, uid, current
working directory etc.) to a block, despite the existance of other
coros.

Another interesting example implements time-sliced multitasking using
interval timers (this could obviously be optimised, but does the job):

   # "timeslice" the given block
   sub timeslice(&) {
      use Time::HiRes ();

      Coro::on_enter {
         # on entering the thread, we set an VTALRM handler to cede
         $SIG{VTALRM} = sub { cede };
         # and then start the interval timer
         Time::HiRes::setitimer &Time::HiRes::ITIMER_VIRTUAL, 0.01, 0.01;
      }; 
      Coro::on_leave {
         # on leaving the thread, we stop the interval timer again
         Time::HiRes::setitimer &Time::HiRes::ITIMER_VIRTUAL, 0, 0;
      }; 

      &{+shift};
   }  

   # use like this:
   timeslice {
      # The following is an endless loop that would normally
      # monopolise the process. Since it runs in a timesliced
      # environment, it will regularly cede to other threads.
      while () { }
   }; 


=item killall

Kills/terminates/cancels all coros except the currently running one.

Note that while this will try to free some of the main interpreter
resources if the calling coro isn't the main coro, but one
cannot free all of them, so if a coro that is not the main coro
calls this function, there will be some one-time resource leak.

=cut

sub killall {
   for (Coro::State::list) {
      $_->cancel
         if $_ != $current && UNIVERSAL::isa $_, "Coro";
   }
}

=back

=head1 CORO OBJECT METHODS

These are the methods you can call on coro objects (or to create
them).

=over 4

=item new Coro \&sub [, @args...]

Create a new coro and return it. When the sub returns, the coro
automatically terminates as if C<terminate> with the returned values were
called. To make the coro run you must first put it into the ready
queue by calling the ready method.

See C<async> and C<Coro::State::new> for additional info about the
coro environment.

=cut

sub _coro_run {
   terminate &{+shift};
}

=item $success = $coro->ready

Put the given coro into the end of its ready queue (there is one
queue for each priority) and return true. If the coro is already in
the ready queue, do nothing and return false.

This ensures that the scheduler will resume this coro automatically
once all the coro of higher priority and all coro of the same
priority that were put into the ready queue earlier have been resumed.

=item $coro->suspend

Suspends the specified coro. A suspended coro works just like any other
coro, except that the scheduler will not select a suspended coro for
execution.

Suspending a coro can be useful when you want to keep the coro from
running, but you don't want to destroy it, or when you want to temporarily
freeze a coro (e.g. for debugging) to resume it later.

A scenario for the former would be to suspend all (other) coros after a
fork and keep them alive, so their destructors aren't called, but new
coros can be created.

=item $coro->resume

If the specified coro was suspended, it will be resumed. Note that when
the coro was in the ready queue when it was suspended, it might have been
unreadied by the scheduler, so an activation might have been lost.

To avoid this, it is best to put a suspended coro into the ready queue
unconditionally, as every synchronisation mechanism must protect itself
against spurious wakeups, and the one in the Coro family certainly do
that.

=item $state->is_new

Returns true iff this Coro object is "new", i.e. has never been run
yet. Those states basically consist of only the code reference to call and
the arguments, but consumes very little other resources. New states will
automatically get assigned a perl interpreter when they are transfered to.

=item $state->is_zombie

Returns true iff the Coro object has been cancelled, i.e.
it's resources freed because they were C<cancel>'ed, C<terminate>'d,
C<safe_cancel>'ed or simply went out of scope.

The name "zombie" stems from UNIX culture, where a process that has
exited and only stores and exit status and no other resources is called a
"zombie".

=item $is_ready = $coro->is_ready

Returns true iff the Coro object is in the ready queue. Unless the Coro
object gets destroyed, it will eventually be scheduled by the scheduler.

=item $is_running = $coro->is_running

Returns true iff the Coro object is currently running. Only one Coro object
can ever be in the running state (but it currently is possible to have
multiple running Coro::States).

=item $is_suspended = $coro->is_suspended

Returns true iff this Coro object has been suspended. Suspended Coros will
not ever be scheduled.

=item $coro->cancel (arg...)

Terminates the given Coro thread and makes it return the given arguments as
status (default: an empty list). Never returns if the Coro is the
current Coro.

This is a rather brutal way to free a coro, with some limitations - if
the thread is inside a C callback that doesn't expect to be canceled,
bad things can happen, or if the cancelled thread insists on running
complicated cleanup handlers that rely on its thread context, things will
not work.

Any cleanup code being run (e.g. from C<guard> blocks) will be run without
a thread context, and is not allowed to switch to other threads. On the
plus side, C<< ->cancel >> will always clean up the thread, no matter
what.  If your cleanup code is complex or you want to avoid cancelling a
C-thread that doesn't know how to clean up itself, it can be better to C<<
->throw >> an exception, or use C<< ->safe_cancel >>.

The arguments to C<< ->cancel >> are not copied, but instead will
be referenced directly (e.g. if you pass C<$var> and after the call
change that variable, then you might change the return values passed to
e.g. C<join>, so don't do that).

The resources of the Coro are usually freed (or destructed) before this
call returns, but this can be delayed for an indefinite amount of time, as
in some cases the manager thread has to run first to actually destruct the
Coro object.

=item $coro->safe_cancel ($arg...)

Works mostly like C<< ->cancel >>, but is inherently "safer", and
consequently, can fail with an exception in cases the thread is not in a
cancellable state.

This method works a bit like throwing an exception that cannot be caught
- specifically, it will clean up the thread from within itself, so
all cleanup handlers (e.g. C<guard> blocks) are run with full thread
context and can block if they wish. The downside is that there is no
guarantee that the thread can be cancelled when you call this method, and
therefore, it might fail. It is also considerably slower than C<cancel> or
C<terminate>.

A thread is in a safe-cancellable state if it either hasn't been run yet,
or it has no C context attached and is inside an SLF function.

The latter two basically mean that the thread isn't currently inside a
perl callback called from some C function (usually via some XS modules)
and isn't currently executing inside some C function itself (via Coro's XS
API).

This call returns true when it could cancel the thread, or croaks with an
error otherwise (i.e. it either returns true or doesn't return at all).

Why the weird interface? Well, there are two common models on how and
when to cancel things. In the first, you have the expectation that your
coro thread can be cancelled when you want to cancel it - if the thread
isn't cancellable, this would be a bug somewhere, so C<< ->safe_cancel >>
croaks to notify of the bug.

In the second model you sometimes want to ask nicely to cancel a thread,
but if it's not a good time, well, then don't cancel. This can be done
relatively easy like this:

   if (! eval { $coro->safe_cancel }) {
      warn "unable to cancel thread: $@";
   }

However, what you never should do is first try to cancel "safely" and
if that fails, cancel the "hard" way with C<< ->cancel >>. That makes
no sense: either you rely on being able to execute cleanup code in your
thread context, or you don't. If you do, then C<< ->safe_cancel >> is the
only way, and if you don't, then C<< ->cancel >> is always faster and more
direct.

=item $coro->schedule_to

Puts the current coro to sleep (like C<Coro::schedule>), but instead
of continuing with the next coro from the ready queue, always switch to
the given coro object (regardless of priority etc.). The readyness
state of that coro isn't changed.

This is an advanced method for special cases - I'd love to hear about any
uses for this one.

=item $coro->cede_to

Like C<schedule_to>, but puts the current coro into the ready
queue. This has the effect of temporarily switching to the given
coro, and continuing some time later.

This is an advanced method for special cases - I'd love to hear about any
uses for this one.

=item $coro->throw ([$scalar])

If C<$throw> is specified and defined, it will be thrown as an exception
inside the coro at the next convenient point in time. Otherwise
clears the exception object.

Coro will check for the exception each time a schedule-like-function
returns, i.e. after each C<schedule>, C<cede>, C<< Coro::Semaphore->down
>>, C<< Coro::Handle->readable >> and so on. Most of those functions (all
that are part of Coro itself) detect this case and return early in case an
exception is pending.

The exception object will be thrown "as is" with the specified scalar in
C<$@>, i.e. if it is a string, no line number or newline will be appended
(unlike with C<die>).

This can be used as a softer means than either C<cancel> or C<safe_cancel
>to ask a coro to end itself, although there is no guarantee that the
exception will lead to termination, and if the exception isn't caught it
might well end the whole program.

You might also think of C<throw> as being the moral equivalent of
C<kill>ing a coro with a signal (in this case, a scalar).

=item $coro->join

Wait until the coro terminates and return any values given to the
C<terminate> or C<cancel> functions. C<join> can be called concurrently
from multiple threads, and all will be resumed and given the status
return once the C<$coro> terminates.

=item $coro->on_destroy (\&cb)

Registers a callback that is called when this coro thread gets destroyed,
that is, after it's resources have been freed but before it is joined. The
callback gets passed the terminate/cancel arguments, if any, and I<must
not> die, under any circumstances.

There can be any number of C<on_destroy> callbacks per coro, and there is
no way currently to remove a callback once added.

=item $oldprio = $coro->prio ($newprio)

Sets (or gets, if the argument is missing) the priority of the
coro thread. Higher priority coro get run before lower priority
coros. Priorities are small signed integers (currently -4 .. +3),
that you can refer to using PRIO_xxx constants (use the import tag :prio
to get then):

   PRIO_MAX > PRIO_HIGH > PRIO_NORMAL > PRIO_LOW > PRIO_IDLE > PRIO_MIN
       3    >     1     >      0      >    -1    >    -3     >    -4

   # set priority to HIGH
   current->prio (PRIO_HIGH);

The idle coro thread ($Coro::idle) always has a lower priority than any
existing coro.

Changing the priority of the current coro will take effect immediately,
but changing the priority of a coro in the ready queue (but not running)
will only take effect after the next schedule (of that coro). This is a
bug that will be fixed in some future version.

=item $newprio = $coro->nice ($change)

Similar to C<prio>, but subtract the given value from the priority (i.e.
higher values mean lower priority, just as in UNIX's nice command).

=item $olddesc = $coro->desc ($newdesc)

Sets (or gets in case the argument is missing) the description for this
coro thread. This is just a free-form string you can associate with a
coro.

This method simply sets the C<< $coro->{desc} >> member to the given
string. You can modify this member directly if you wish, and in fact, this
is often preferred to indicate major processing states that cna then be
seen for example in a L<Coro::Debug> session:

   sub my_long_function {
      local $Coro::current->{desc} = "now in my_long_function";
      ...
      $Coro::current->{desc} = "my_long_function: phase 1";
      ...
      $Coro::current->{desc} = "my_long_function: phase 2";
      ...
   }

=cut

sub desc {
   my $old = $_[0]{desc};
   $_[0]{desc} = $_[1] if @_ > 1;
   $old;
}

sub transfer {
   require Carp;
   Carp::croak ("You must not call ->transfer on Coro objects. Use Coro::State objects or the ->schedule_to method. Caught");
}

=back

=head1 GLOBAL FUNCTIONS

=over 4

=item Coro::nready

Returns the number of coro that are currently in the ready state,
i.e. that can be switched to by calling C<schedule> directory or
indirectly. The value C<0> means that the only runnable coro is the
currently running one, so C<cede> would have no effect, and C<schedule>
would cause a deadlock unless there is an idle handler that wakes up some
coro.

=item my $guard = Coro::guard { ... }

This function still exists, but is deprecated. Please use the
C<Guard::guard> function instead.

=cut

BEGIN { *guard = \&Guard::guard }

=item unblock_sub { ... }

This utility function takes a BLOCK or code reference and "unblocks" it,
returning a new coderef. Unblocking means that calling the new coderef
will return immediately without blocking, returning nothing, while the
original code ref will be called (with parameters) from within another
coro.

The reason this function exists is that many event libraries (such as
the venerable L<Event|Event> module) are not thread-safe (a weaker form
of reentrancy). This means you must not block within event callbacks,
otherwise you might suffer from crashes or worse. The only event library
currently known that is safe to use without C<unblock_sub> is L<EV> (but
you might still run into deadlocks if all event loops are blocked).

Coro will try to catch you when you block in the event loop
("FATAL:$Coro::IDLE blocked itself"), but this is just best effort and
only works when you do not run your own event loop.

This function allows your callbacks to block by executing them in another
coro where it is safe to block. One example where blocking is handy
is when you use the L<Coro::AIO|Coro::AIO> functions to save results to
disk, for example.

In short: simply use C<unblock_sub { ... }> instead of C<sub { ... }> when
creating event callbacks that want to block.

If your handler does not plan to block (e.g. simply sends a message to
another coro, or puts some other coro into the ready queue), there is
no reason to use C<unblock_sub>.

Note that you also need to use C<unblock_sub> for any other callbacks that
are indirectly executed by any C-based event loop. For example, when you
use a module that uses L<AnyEvent> (and you use L<Coro::AnyEvent>) and it
provides callbacks that are the result of some event callback, then you
must not block either, or use C<unblock_sub>.

=cut

our @unblock_queue;

# we create a special coro because we want to cede,
# to reduce pressure on the coro pool (because most callbacks
# return immediately and can be reused) and because we cannot cede
# inside an event callback.
our $unblock_scheduler = new Coro sub {
   while () {
      while (my $cb = pop @unblock_queue) {
         &async_pool (@$cb);

         # for short-lived callbacks, this reduces pressure on the coro pool
         # as the chance is very high that the async_poll coro will be back
         # in the idle state when cede returns
         cede;
      }
      schedule; # sleep well
   }
};
$unblock_scheduler->{desc} = "[unblock_sub scheduler]";

sub unblock_sub(&) {
   my $cb = shift;

   sub {
      unshift @unblock_queue, [$cb, @_];
      $unblock_scheduler->ready;
   }
}

=item $cb = rouse_cb

Create and return a "rouse callback". That's a code reference that,
when called, will remember a copy of its arguments and notify the owner
coro of the callback.

See the next function.

=item @args = rouse_wait [$cb]

Wait for the specified rouse callback (or the last one that was created in
this coro).

As soon as the callback is invoked (or when the callback was invoked
before C<rouse_wait>), it will return the arguments originally passed to
the rouse callback. In scalar context, that means you get the I<last>
argument, just as if C<rouse_wait> had a C<return ($a1, $a2, $a3...)>
statement at the end.

See the section B<HOW TO WAIT FOR A CALLBACK> for an actual usage example.

=back

=cut

for my $module (qw(Channel RWLock Semaphore SemaphoreSet Signal Specific)) {
   my $old = defined &{"Coro::$module\::new"} && \&{"Coro::$module\::new"};

   *{"Coro::$module\::new"} = sub {
      require "Coro/$module.pm";

      # some modules have their new predefined in State.xs, some don't
      *{"Coro::$module\::new"} = $old
         if $old;

      goto &{"Coro::$module\::new"};
   };
}

1;

=head1 HOW TO WAIT FOR A CALLBACK

It is very common for a coro to wait for some callback to be
called. This occurs naturally when you use coro in an otherwise
event-based program, or when you use event-based libraries.

These typically register a callback for some event, and call that callback
when the event occured. In a coro, however, you typically want to
just wait for the event, simplyifying things.

For example C<< AnyEvent->child >> registers a callback to be called when
a specific child has exited:

   my $child_watcher = AnyEvent->child (pid => $pid, cb => sub { ... });

But from within a coro, you often just want to write this:

   my $status = wait_for_child $pid;

Coro offers two functions specifically designed to make this easy,
C<Coro::rouse_cb> and C<Coro::rouse_wait>.

The first function, C<rouse_cb>, generates and returns a callback that,
when invoked, will save its arguments and notify the coro that
created the callback.

The second function, C<rouse_wait>, waits for the callback to be called
(by calling C<schedule> to go to sleep) and returns the arguments
originally passed to the callback.

Using these functions, it becomes easy to write the C<wait_for_child>
function mentioned above:

   sub wait_for_child($) {
      my ($pid) = @_;

      my $watcher = AnyEvent->child (pid => $pid, cb => Coro::rouse_cb);

      my ($rpid, $rstatus) = Coro::rouse_wait;
      $rstatus
   }

In the case where C<rouse_cb> and C<rouse_wait> are not flexible enough,
you can roll your own, using C<schedule>:

   sub wait_for_child($) {
      my ($pid) = @_;

      # store the current coro in $current,
      # and provide result variables for the closure passed to ->child
      my $current = $Coro::current;
      my ($done, $rstatus);

      # pass a closure to ->child
      my $watcher = AnyEvent->child (pid => $pid, cb => sub {
         $rstatus = $_[1]; # remember rstatus
         $done = 1; # mark $rstatus as valud
      });

      # wait until the closure has been called
      schedule while !$done;

      $rstatus
   }


=head1 BUGS/LIMITATIONS

=over 4

=item fork with pthread backend

When Coro is compiled using the pthread backend (which isn't recommended
but required on many BSDs as their libcs are completely broken), then
coro will not survive a fork. There is no known workaround except to
fix your libc and use a saner backend.

=item perl process emulation ("threads")

This module is not perl-pseudo-thread-safe. You should only ever use this
module from the first thread (this requirement might be removed in the
future to allow per-thread schedulers, but Coro::State does not yet allow
this). I recommend disabling thread support and using processes, as having
the windows process emulation enabled under unix roughly halves perl
performance, even when not used.

Attempts to use threads created in another emulated process will crash
("cleanly", with a null pointer exception).

=item coro switching is not signal safe

You must not switch to another coro from within a signal handler (only
relevant with %SIG - most event libraries provide safe signals), I<unless>
you are sure you are not interrupting a Coro function.

That means you I<MUST NOT> call any function that might "block" the
current coro - C<cede>, C<schedule> C<< Coro::Semaphore->down >> or
anything that calls those. Everything else, including calling C<ready>,
works.

=back


=head1 WINDOWS PROCESS EMULATION

A great many people seem to be confused about ithreads (for example, Chip
Salzenberg called me unintelligent, incapable, stupid and gullible,
while in the same mail making rather confused statements about perl
ithreads (for example, that memory or files would be shared), showing his
lack of understanding of this area - if it is hard to understand for Chip,
it is probably not obvious to everybody).

What follows is an ultra-condensed version of my talk about threads in
scripting languages given on the perl workshop 2009:

The so-called "ithreads" were originally implemented for two reasons:
first, to (badly) emulate unix processes on native win32 perls, and
secondly, to replace the older, real thread model ("5.005-threads").

It does that by using threads instead of OS processes. The difference
between processes and threads is that threads share memory (and other
state, such as files) between threads within a single process, while
processes do not share anything (at least not semantically). That
means that modifications done by one thread are seen by others, while
modifications by one process are not seen by other processes.

The "ithreads" work exactly like that: when creating a new ithreads
process, all state is copied (memory is copied physically, files and code
is copied logically). Afterwards, it isolates all modifications. On UNIX,
the same behaviour can be achieved by using operating system processes,
except that UNIX typically uses hardware built into the system to do this
efficiently, while the windows process emulation emulates this hardware in
software (rather efficiently, but of course it is still much slower than
dedicated hardware).

As mentioned before, loading code, modifying code, modifying data
structures and so on is only visible in the ithreads process doing the
modification, not in other ithread processes within the same OS process.

This is why "ithreads" do not implement threads for perl at all, only
processes. What makes it so bad is that on non-windows platforms, you can
actually take advantage of custom hardware for this purpose (as evidenced
by the forks module, which gives you the (i-) threads API, just much
faster).

Sharing data is in the i-threads model is done by transfering data
structures between threads using copying semantics, which is very slow -
shared data simply does not exist. Benchmarks using i-threads which are
communication-intensive show extremely bad behaviour with i-threads (in
fact, so bad that Coro, which cannot take direct advantage of multiple
CPUs, is often orders of magnitude faster because it shares data using
real threads, refer to my talk for details).

As summary, i-threads *use* threads to implement processes, while
the compatible forks module *uses* processes to emulate, uhm,
processes. I-threads slow down every perl program when enabled, and
outside of windows, serve no (or little) practical purpose, but
disadvantages every single-threaded Perl program.

This is the reason that I try to avoid the name "ithreads", as it is
misleading as it implies that it implements some kind of thread model for
perl, and prefer the name "windows process emulation", which describes the
actual use and behaviour of it much better.

=head1 SEE ALSO

Event-Loop integration: L<Coro::AnyEvent>, L<Coro::EV>, L<Coro::Event>.

Debugging: L<Coro::Debug>.

Support/Utility: L<Coro::Specific>, L<Coro::Util>.

Locking and IPC: L<Coro::Signal>, L<Coro::Channel>, L<Coro::Semaphore>,
L<Coro::SemaphoreSet>, L<Coro::RWLock>.

I/O and Timers: L<Coro::Timer>, L<Coro::Handle>, L<Coro::Socket>, L<Coro::AIO>.

Compatibility with other modules: L<Coro::LWP> (but see also L<AnyEvent::HTTP> for
a better-working alternative), L<Coro::BDB>, L<Coro::Storable>,
L<Coro::Select>.

XS API: L<Coro::MakeMaker>.

Low level Configuration, Thread Environment, Continuations: L<Coro::State>.

=head1 AUTHOR

 Marc Lehmann <schmorp@schmorp.de>
 http://home.schmorp.de/

=cut

