=head1 NAME

Coro::State - create and manage simple coroutines

=head1 SYNOPSIS

 use Coro::State;

 $new = new Coro::State sub {
    print "in coroutine (called with @_), switching back\n";
    $new->transfer ($main);
    print "in coroutine again, switching back\n";
    $new->transfer ($main);
 }, 5;

 $main = new Coro::State;

 print "in main, switching to coroutine\n";
 $main->transfer ($new);
 print "back in main, switch to coroutine again\n";
 $main->transfer ($new);
 print "back in main\n";

=head1 DESCRIPTION

This module implements coroutines. Coroutines, similar to continuations,
allow you to run more than one "thread of execution" in parallel. Unlike
threads, there is no parallelism and only voluntary switching is used so
locking problems are greatly reduced.

This can be used to implement non-local jumps, exception handling,
(non-clonable) continuations and more.

This module provides only low-level functionality. See L<Coro> and related
modules for a higher level process abstraction including scheduling.

=head2 MODEL

Coro::State implements two different coroutine models: Perl and C. The
C coroutines (called cctx's) are basically simplified perl interpreters
running/interpreting the Perl coroutines. A single interpreter can run any
number of Perl coroutines, so usually there are very few C coroutines.

When Perl code calls a C function (e.g. in an extension module) and that
C function then calls back into Perl or does a coroutine switch the C
coroutine can no longer execute other Perl coroutines, so it stays tied to
the specific coroutine until it returns to the original Perl caller, after
which it is again avaikable to run other Perl coroutines.

The main program always has its own "C coroutine" (which really is
*the* Perl interpreter running the whole program), so there will always
be at least one additional C coroutine. You can use the debugger (see
L<Coro::Debug>) to find out which coroutines are tied to their cctx and
which aren't.

=head2 MEMORY CONSUMPTION

A newly created coroutine that has not been used only allocates a
relatively small (a hundred bytes) structure. Only on the first
C<transfer> will perl allocate stacks (a few kb, 64 bit architetcures
use twice as much, i.e. a few kb :) and optionally a C stack/coroutine
(cctx) for coroutines that recurse through C functions. All this is very
system-dependent. On my x86-pc-linux-gnu system this amounts to about 2k
per (non-trivial but simple) coroutine.

You can view the actual memory consumption using Coro::Debug. Keep in mind
that a for loop or other block constructs can easily consume 100-200 bytes
per nesting level.

=cut

package Coro::State;

use strict;
no warnings "uninitialized";

use Carp;

use Time::HiRes (); # currently only used for PerlIO::cede

our $DIEHOOK;
our $WARNHOOK;

BEGIN {
   $DIEHOOK  = sub { };
   $WARNHOOK = sub { warn $_[0] };
}

sub diehook  { &$DIEHOOK  }
sub warnhook { &$WARNHOOK }

use XSLoader;

BEGIN {
   our $VERSION = 4.8;

   # must be done here because the xs part expects it to exist
   # it might exist already because Coro::Specific created it.
   $Coro::current ||= { };

   {
      # save/restore the handlers before/after overwriting %SIG magic
      local $SIG{__DIE__};
      local $SIG{__WARN__};

      XSLoader::load __PACKAGE__, $VERSION;
   }

   # need to do it after overwriting the %SIG magic
   $SIG{__DIE__}  ||= \&diehook;
   $SIG{__WARN__} ||= \&warnhook;
}

use Exporter;
use base Exporter::;

=head2 GLOBAL VARIABLES

=over 4

=item $Coro::State::DIEHOOK

This works similarly to C<$SIG{__DIE__}> and is used as the default die
hook for newly created coroutines. This is useful if you want some generic
logging function that works for all coroutines that don't set their own
hook.

When Coro::State is first loaded it will install these handlers for the
main program, too, unless they have been overwritten already.

The default handlers provided will behave like the built-in ones (as if
they weren't there).

Note 1: You I<must> store a valid code reference in these variables,
C<undef> will I<not> do.

Note 2: The value of this variable will be shared among all coroutines, so
changing its value will change it in all coroutines that don't have their
own die handler.

=item $Coro::State::WARNHOOK

Similar to above die hook, but augments C<$SIG{__WARN__}>.

=back

=head2 FUNCTIONS

=over 4

=item $coro = new Coro::State [$coderef[, @args...]]

Create a new coroutine and return it. The first C<transfer> call to this
coroutine will start execution at the given coderef.

If the subroutine returns the program will be terminated as if execution
of the main program ended.

If it throws an exception the program will terminate unless the exception
is caught, exactly like in the main program.

Calling C<exit> in a coroutine does the same as calling it in the main
program.

If the coderef is omitted this function will create a new "empty"
coroutine, i.e. a coroutine that cannot be transfered to but can be used
to save the current coroutine state in (note that this is dangerous, as no
reference is taken to ensure that the "current coroutine state" survives,
the caller is responsible to ensure that the cloned state does not go
away).

The returned object is an empty hash which can be used for any purpose
whatsoever, for example when subclassing Coro::State.

Certain variables are "localised" to each coroutine, that is, certain
"global" variables are actually per coroutine. Not everything that would
sensibly be localised currently is, and not everything that is localised
makes sense for every application, and the future might bring changes.

The following global variables can have different values per coroutine,
and have the stated initial values:

   Variable       Initial Value
   @_             whatever arguments were passed to the Coro
   $_             undef
   $@             undef
   $/             "\n"
   $SIG{__DIE__}  aliased to $Coro::State::DIEHOOK(*)
   $SIG{__WARN__} aliased to $Coro::State::WARNHOOK(*)
   (default fh)   *STDOUT
   $1, $2...      all regex results are initially undefined

   (*) reading the value from %SIG is not supported, but local'ising is.

If you feel that something important is missing then tell me. Also
remember that every function call that might call C<transfer> (such
as C<Coro::Channel::put>) might clobber any global and/or special
variables. Yes, this is by design ;) You can always create your own
process abstraction model that saves these variables.

The easiest way to do this is to create your own scheduling primitive like
in the code below, and use it in your coroutines:

  sub my_cede {
     local ($;, ...);
     Coro::cede;
  }

=cut

# this is called for each newly created C coroutine,
# and is being artificially injected into the opcode flow.
# its sole purpose is to call transfer() once so it knows
# the stop level stack frame for stack sharing.
sub _cctx_init {
   _set_stacklevel $_[0];
}

=item $state->call ($coderef)

Try to call the given C<$coderef> in the context of the given state. This
works even when the state is currently within an XS function, and can
be very dangerous. You can use it to acquire stack traces etc. (see the
Coro::Debug module for more details). The coderef MUST NOT EVER transfer
to another state.

=item $state->eval ($string)

Like C<call>, but eval's the string. Dangerous.

=item $state->throw ($exception)

Makes the coroutine throw the given exception as soon as it regains
control.

=item $state->swap_defsv

=item $state->swap_defav

Swap the current C<$_> (swap_defsv) or C<@_> (swap_defav) with the
equivalent in the saved state of C<$state>. This can be used to give the
coroutine a defined content for C<@_> and C<$_> before transfer'ing to it.

=item $state->trace ($flags)

Internal function to control tracing. I just mention this so you can stay
away from abusing it.

=item $prev->transfer ($next)

Save the state of the current subroutine in C<$prev> and switch to the
coroutine saved in C<$next>.

The "state" of a subroutine includes the scope, i.e. lexical variables and
the current execution state (subroutine, stack).

=item $state->has_cctx

Returns whether the state currently uses a cctx/C coroutine. An active
state always has a cctx, as well as the main program. Other states only
use a cctxts when needed.

=item $bytes = $state->rss

Returns the memory allocated by the coroutine (which includes
static structures, various perl stacks but NOT local variables,
arguments or any C stack).

=item Coro::State::cctx_count

Returns the number of C-level coroutines allocated. If this number is
very high (more than a dozen) it might help to identify points of C-level
recursion in your code and moving this into a separate coroutine.

=item Coro::State::cctx_idle

Returns the number of allocated but idle (free for reuse) C level
coroutines. Currently, Coro will limit the number of idle/unused cctxs to
8.

=item Coro::State::cctx_stacksize [$new_stacksize]

Returns the current C stack size and optionally sets the new I<minimum>
stack size to C<$new_stacksize> I<long>s. Existing stacks will not
be changed, but Coro will try to replace smaller stacks as soon as
possible. Any Coro::State that starts to use a stack after this call is
guaranteed this minimum stack size.

Please note that Coroutines will only need to use a C-level stack if the
interpreter recurses or calls a function in a module that calls back into
the interpreter, so use of this feature is usually never needed.

=item Coro::State::force_cctx

Forces the allocation of a C context for the currently running coroutine
(if not already done). Apart from benchmarking there is little point
in doing so, however.

=item @states = Coro::State::list

Returns a list of all states currently allocated.

=cut

sub debug_desc {
   $_[0]{desc}
}

1;

=back

=head1 BUGS

This module is not thread-safe. You must only ever use this module from
the same thread (this requirement might be removed in the future).

=head1 SEE ALSO

L<Coro>.

=head1 AUTHOR

 Marc Lehmann <schmorp@schmorp.de>
 http://home.schmorp.de/

=cut

