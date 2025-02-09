# pg_mask
A tiny data mask utility written in C

## Prerequisites
- GCC
- GNU Make
- PostgreSQL instance


# Development
This project is being developed with C language using [C-Language Functions](https://www.postgresql.org/docs/current/xfunc-c.html) of PostgreSQL, 
that is also provide an extension makefile that manages library directories and installation targets.
In order to include PostgreSQL extension makefile, the ```pg_config``` binary must be available.

```shell
$ make                             # if pg_config is globally available
$ make PG_CONFIG=<path-to-binary>  # if pg_config is not globally available
```

# Testing
This project uses [PostgreSQL Regression Test](https://www.postgresql.org/docs/current/regress.html) utility.
First, please install the extension, and then run all regression tests.

```shell
$ make install
$ make installcheck
```
