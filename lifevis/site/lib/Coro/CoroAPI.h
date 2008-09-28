#ifndef CORO_API_H
#define CORO_API_H

#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#ifndef pTHX_
# define pTHX_
# define aTHX_
# define pTHX
# define aTHX
#endif

/*struct coro;*/ /* opaque */

/* private structure, always use the provided macros below */
struct CoroAPI {
  I32 ver;
  I32 rev;
#define CORO_API_VERSION 6
#define CORO_API_REVISION 1
  void (*transfer) (SV *prev_sv, SV *next_sv); /* Coro::State */

  void (*schedule) (void); /* Coro */
  int (*cede) (void);
  int (*cede_notself) (void);
  int (*ready) (SV *coro_sv);
  int (*is_ready) (SV *coro_sv);
  int *nready;
  SV *current;

  void (*readyhook) (void);
};

static struct CoroAPI *GCoroAPI;

/* public API macros */
#define CORO_TRANSFER(prev,next) GCoroAPI->transfer (aTHX_ (prev), (next))
#define CORO_SCHEDULE            GCoroAPI->schedule ()
#define CORO_CEDE                GCoroAPI->cede ()
#define CORO_CEDE_NOTSELF        GCoroAPI->cede_notself ()
#define CORO_READY(coro)         GCoroAPI->ready (coro)
#define CORO_IS_READY(coro)      GCoroAPI->is_ready (coro)
#define CORO_NREADY              (*GCoroAPI->nready)
#define CORO_CURRENT             SvRV (GCoroAPI->current)
#define CORO_READYHOOK           (GCoroAPI->readyhook)

#define I_CORO_API(YourName)                                                             \
STMT_START {                                                                             \
  SV *sv = perl_get_sv ("Coro::API", 0);                                                 \
  if (!sv) croak ("Coro::API not found");                                                \
  GCoroAPI = (struct CoroAPI*) SvIV (sv);                                                \
  if (GCoroAPI->ver != CORO_API_VERSION                                                  \
      || GCoroAPI->rev < CORO_API_REVISION)                                              \
    croak ("Coro::API version mismatch (%d.%d vs. %d.%d) -- please recompile %s",        \
           GCoroAPI->ver, GCoroAPI->rev, CORO_API_VERSION, CORO_API_REVISION, YourName); \
} STMT_END

#endif

