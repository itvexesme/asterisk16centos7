$ docker compose up -d


$ docker ps
CONTAINER ID   IMAGE                        COMMAND                  CREATED          STATUS          PORTS                                                  NAMES                    4e8a371c0bf6   mysql:8.0                    "docker-entrypoint.s"   21 minutes ago   Up 21 minutes   0.0.0.0:3306->3306/tcp, :::3306->3306/tcp, 33060/tcp   asterisk16centos7-mysql-13e6d340900f6   asterisk16centos7:26102023   "asterisk -f"            21 minutes ago   Up 21 minutes                                                          asterisk16centos7-asterisk-1


$ docker exec -ti 3e6d340900 /bin/sh


sh-4.2# cat /etc/odbcinst.ini
[PostgreSQL]
Description=ODBC for PostgreSQL
Driver=/usr/lib/psqlodbcw.so
Setup=/usr/lib/libodbcpsqlS.so
Driver64=/usr/lib64/psqlodbcw.so
Setup64=/usr/lib64/libodbcpsqlS.so
FileUsage=1
                                                                                           [MySQL]                                                                                    Description=ODBC for MySQL                                                                 Driver=/usr/lib/libmyodbc5.so                                                              Setup=/usr/lib/libodbcmyS.so                                                               Driver64=/usr/lib64/libmyodbc5.so                                                          Setup64=/usr/lib64/libodbcmyS.so                                                           FileUsage=1                                                                                                                                                                           [MySQL ODBC 8.0 Unicode Driver]                                                            Driver=/usr/lib64/libmyodbc8w.so                                                           SETUP=/usr/lib64/libmyodbc8S.so                                                            UsageCount=1                                                                                                                                                                          [MySQL ODBC 8.0 ANSI Driver]                                                               Driver=/usr/lib64/libmyodbc8a.so                                                           SETUP=/usr/lib64/libmyodbc8S.so                                                            UsageCount=1    


sh-4.2# cat /etc/odbc.ini
[asterisk]
Description=MySQL connection to 'asterisk' database                                        driver=MySQL ODBC 8.0 Unicode Driver                                                       server=mysql                                                                               database=realtimedb                                                                        UID=rt_user                                                                                PWD=123                                                                                    Charset=utf8                                                                               Port=3306                                                                                  option=3   


sh-4.2# echo "select 1" | isql -v asterisk
+---------------------------------------+
| Connected!                            |
|                                       |
| sql-statement                         |
| help [tablename]                      |
| quit                                  |
|                                       |
+---------------------------------------+                                                  SQL> select 1
+---------------------+
| 1                   |
+---------------------+                                                                    | 1                   |
+---------------------+                                                                    SQLRowCount returns 1                     
