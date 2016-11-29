Usage:

```bash
$ docker run --rm -it sqlplus <user>/<password>@<host>:1521/ORCL

SQL*Plus: Release 11.2.0.3.0 Production on Tue Aug 11 15:41:07 2015

Copyright (c) 1982, 2011, Oracle.  All rights reserved.


Conectado a:
Oracle Database 11g Release 11.2.0.1.0 - 64bit Production

SQL> _
```

`/home/oracle/scripts` is exposed as a volume and also set as `SQLPATH`.
Scripts placed in the directory bound to this volume can be sourced
simply from SQL*Plus.

```
$ echo "SELECT 'World' AS Hello FROM dual;" > ~/orascripts/test.sql
$ docker run --rm -it -v ~/orascripts:/home/oracle/scripts:ro sqlplus <user>/<password>@<host>:1521/ORCL
...
SQL> SET ECHO ON
SQL> @test.sql
SQL> SELECT 'World' AS Hello FROM dual;

HELLO
-----
World
```
