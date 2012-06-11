#ifndef EV_API_H
#define EV_API_H

#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#ifndef pTHX_
# define pTHX_
# define aTHX_
# define pTHX
# define aTHX
#endif

#define EV_COMMON				\
  int e_flags; /* cheap on 64 bit systems */	\
  SV *loop;                                     \
  SV *self; /* contains this struct */		\
  SV *cb_sv, *fh, *data;

#ifndef EV_PROTOTYPES
# define EV_PROTOTYPES 0
#endif

#ifndef EV_H
# define EV_H <EV/ev.h>
#endif

#include EV_H

#define EV_STANDALONE   1
#define EV_MULTIPLICITY 1

struct EVAPI {
  I32 ver;
  I32 rev;
#define EV_API_VERSION 4
#define EV_API_REVISION 1

  struct ev_loop *default_loop;
  unsigned int supported_backends;
  unsigned int recommended_backends;
  unsigned int embeddable_backends;

  /* perl fh or fd int to fd */
  int (*sv_fileno) (SV *fh);
  /* signal number/name to signum */
  int (*sv_signum) (SV *fh);

  /* same as libev functions */
  ev_tstamp (*time_)(void);
  void (*sleep_)(ev_tstamp);
  ev_tstamp (*now)(EV_P);
  struct ev_loop *(*loop_new)(unsigned int);
  void (*loop_destroy)(EV_P);
  void (*loop_fork)(EV_P);
  unsigned int (*loop_count)(EV_P);
  unsigned int (*backend)(EV_P);
  void (*loop)(EV_P_ int flags);
  void (*unloop)(EV_P_ int how);
  void (*ref)(EV_P);
  void (*unref)(EV_P);
  void (*once)(EV_P_ int fd, int events, ev_tstamp timeout, void (*cb)(int revents, void *arg), void *arg);
  int  (*clear_pending)(EV_P_ void *);
  void (*invoke)(EV_P_ void *, int);
  void (*io_start)(EV_P_ ev_io *);
  void (*io_stop) (EV_P_ ev_io *);
  void (*timer_start)(EV_P_ ev_timer *);
  void (*timer_stop) (EV_P_ ev_timer *);
  void (*timer_again)(EV_P_ ev_timer *);
  void (*periodic_start)(EV_P_ ev_periodic *);
  void (*periodic_stop) (EV_P_ ev_periodic *);
  void (*signal_start)(EV_P_ ev_signal *);
  void (*signal_stop) (EV_P_ ev_signal *);
  void (*child_start)(EV_P_ ev_child *);
  void (*child_stop) (EV_P_ ev_child *);
  void (*stat_start)(EV_P_ ev_stat *);
  void (*stat_stop) (EV_P_ ev_stat *);
  void (*stat_stat) (EV_P_ ev_stat *);
  void (*idle_start)(EV_P_ ev_idle *);
  void (*idle_stop) (EV_P_ ev_idle *);
  void (*prepare_start)(EV_P_ ev_prepare *);
  void (*prepare_stop) (EV_P_ ev_prepare *);
  void (*check_start)(EV_P_ ev_check *);
  void (*check_stop) (EV_P_ ev_check *);
  void (*embed_start)(EV_P_ ev_embed *);
  void (*embed_stop) (EV_P_ ev_embed *);
  void (*embed_sweep)(EV_P_ ev_embed *);
  void (*fork_start) (EV_P_ ev_fork *);
  void (*fork_stop)  (EV_P_ ev_fork *);
  void (*async_start) (EV_P_ ev_async *);
  void (*async_stop)  (EV_P_ ev_async *);
  void (*async_send)  (EV_P_ ev_async *);
};

#if !EV_PROTOTYPES
# undef EV_DEFAULT
# undef EV_DEFAULT_
# undef EV_DEFAULT_UC
# undef EV_DEFAULT_UC_
# undef EV_A_
# define EV_DEFAULT                GEVAPI->default_loop
# define EV_DEFAULT_UC             GEVAPI->default_loop
# define ev_supported_backends()   GEVAPI->supported_backends
# define ev_recommended_backends() GEVAPI->recommended_backends
# define ev_embeddable_backends()  GEVAPI->embeddable_backends

# define sv_fileno(sv)             GEVAPI->sv_fileno (sv)
# define sv_signum(sv)             GEVAPI->sv_signum (sv)
# define ev_time()                 GEVAPI->time_ ()
# define ev_sleep(time)            GEVAPI->sleep_ ((time))
# define ev_loop_new(flags)        GEVAPI->loop_new ((flags))
# define ev_loop_destroy(loop)     GEVAPI->loop_destroy ((loop))
# define ev_loop_fork(loop)        GEVAPI->loop_fork ((loop))
# define ev_loop_count(loop)       GEVAPI->loop_count ((loop))
# define ev_now(loop)              GEVAPI->now ((loop))
# define ev_backend(loop)          GEVAPI->backend ((loop))
# define ev_loop(l,flags)          GEVAPI->loop ((l), (flags))
# define ev_unloop(loop,how)       GEVAPI->unloop ((loop), (how))
# define ev_once(loop,fd,events,timeout,cb,arg) GEVAPI->once ((loop), (fd), (events), (timeout), (cb), (arg))
# define ev_io_start(l,w)          GEVAPI->io_start ((l), (w))
# define ev_io_stop(l,w)           GEVAPI->io_stop  ((l), (w))
# define ev_timer_start(l,w)       GEVAPI->timer_start ((l), (w))
# define ev_timer_stop(l,w)        GEVAPI->timer_stop  ((l), (w))
# define ev_timer_again(l,w)       GEVAPI->timer_again ((l), (w))
# define ev_periodic_start(l,w)    GEVAPI->periodic_start ((l), (w))
# define ev_periodic_stop(l,w)     GEVAPI->periodic_stop  ((l), (w))
# define ev_signal_start(l,w)      GEVAPI->signal_start ((l), (w))
# define ev_signal_stop(l,w)       GEVAPI->signal_stop  ((l), (w))
# define ev_idle_start(l,w)        GEVAPI->idle_start ((l), (w))
# define ev_idle_stop(l,w)         GEVAPI->idle_stop  ((l), (w))
# define ev_prepare_start(l,w)     GEVAPI->prepare_start ((l), (w))
# define ev_prepare_stop(l,w)      GEVAPI->prepare_stop  ((l), (w))
# define ev_check_start(l,w)       GEVAPI->check_start ((l), (w))
# define ev_check_stop(l,w)        GEVAPI->check_stop  ((l), (w))
# define ev_child_start(l,w)       GEVAPI->child_start ((l), (w))
# define ev_child_stop(l,w)        GEVAPI->child_stop  ((l), (w))
# define ev_stat_start(l,w)        GEVAPI->stat_start ((l), (w))
# define ev_stat_stop(l,w)         GEVAPI->stat_stop  ((l), (w))
# define ev_stat_stat(l,w)         GEVAPI->stat_stat  ((l), (w))
# define ev_embed_start(l,w)       GEVAPI->embed_start ((l), (w))
# define ev_embed_stop(l,w)        GEVAPI->embed_stop  ((l), (w))
# define ev_embed_sweep(l,w)       GEVAPI->embed_sweep ((l), (w))
# define ev_fork_start(l,w)        GEVAPI->fork_start ((l), (w))
# define ev_fork_stop(l,w)         GEVAPI->fork_stop  ((l), (w))
# define ev_async_start(l,w)       GEVAPI->async_start ((l), (w))
# define ev_async_stop(l,w)        GEVAPI->async_stop  ((l), (w))
# define ev_async_send(l,w)        GEVAPI->async_send  ((l), (w))
# define ev_ref(loop)              GEVAPI->ref   (loop)
# define ev_unref(loop)            GEVAPI->unref (loop)
# define ev_clear_pending(l,w)     GEVAPI->clear_pending ((l), (w))
# define ev_invoke(l,w,rev)        GEVAPI->invoke (l, w, rev)
#endif

static struct EVAPI *GEVAPI;

#define I_EV_API(YourName)                                                       \
STMT_START {                                                                     \
  SV *sv = perl_get_sv ("EV::API", 0);                                           \
  if (!sv) croak ("EV::API not found");                                          \
  GEVAPI = (struct EVAPI*) SvIV (sv);                                            \
  if (GEVAPI->ver != EV_API_VERSION                                              \
      || GEVAPI->rev < EV_API_REVISION)                                          \
    croak ("EV::API version mismatch (%d.%d vs. %d.%d) -- please recompile %s",  \
           GEVAPI->ver, GEVAPI->rev, EV_API_VERSION, EV_API_REVISION, YourName); \
} STMT_END

#endif

