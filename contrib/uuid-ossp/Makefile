# contrib/uuid-ossp/Makefile

MODULE_big = uuid-ossp
OBJS = \
	$(WIN32RES) \
	uuid-ossp.o

EXTENSION = uuid-ossp
DATA = uuid-ossp--1.1.sql uuid-ossp--1.0--1.1.sql
PGFILEDESC = "uuid-ossp - UUID generation"

REGRESS = uuid_ossp
ORA_REGRESS = ivy_uuid_ossp

SHLIB_LINK += $(UUID_LIBS)

ifdef USE_PGXS
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
else
subdir = contrib/uuid-ossp
top_builddir = ../..
include $(top_builddir)/src/Makefile.global
include $(top_srcdir)/contrib/contrib-global.mk
endif
