# src/oracle_test/modules/brin/Makefile
# add the file for requirement "SQL PARSER"

EXTRA_INSTALL = contrib/pageinspect contrib/pg_walinspect

ISOLATION = summarization-and-inprogress-insertion
TAP_TESTS = 1

ifdef USE_PGXS
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
else
subdir = src/oracle_test/modules/brin
top_builddir = ../../../..
include $(top_builddir)/src/Makefile.global
include $(top_srcdir)/contrib/contrib-global.mk
endif
