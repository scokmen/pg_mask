################################
# Extension settings
################################
EXTENSION = pg_mask
DATA = $(EXTENSION)--1.0.0.sql
REGRESS = $(EXTENSION)
TEST_PGPORT ?= 5432
TEST_PGHOST ?= localhost
TEST_PGUSER ?= postgres
REGRESS_OPTS =            \
	--host=$(TEST_PGHOST) \
	--port=$(TEST_PGPORT) \
	--user=$(TEST_PGUSER) \
	--load-extension=$(EXTENSION)
################################

################################
# Compiler flags
# Source  : https://github.com/citusdata/pg_cron/blob/main/Makefile
# Document: https://www.postgresql.org/docs/current/extend-pgxs.html
################################
MODULE_big = $(EXTENSION)
OBJS = $(patsubst %.c,%.o,$(wildcard src/*.c))

ifeq ($(CC),gcc)
    PG_CPPFLAGS = -std=c99 -Wall -Wextra -Werror -Wno-unused-parameter -Wno-uninitialized -Wno-implicit-fallthrough -Iinclude -I$(libpq_srcdir)
else
    PG_CPPFLAGS = -std=c99 -Wall -Wextra -Werror -Wno-unused-parameter -Wno-implicit-fallthrough -Iinclude -I$(libpq_srcdir)
endif
ifeq ($(shell uname -s),SunOS)
    PG_CPPFLAGS += -Wno-sign-compare -D__EXTENSIONS__
endif
################################


################################
# Linker settings
################################
PG_CONFIG ?= pg_config
SHLIB_LINK = $(libpq)
EXTRA_CLEAN += $(addprefix src/,*.gcno *.gcda)
PGXS := $(shell $(PG_CONFIG) --pgxs)
################################

include $(PGXS)