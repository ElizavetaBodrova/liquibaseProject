alter session set container=ORCLPDB1;
CREATE USER simpleUser IDENTIFIED BY "app";
GRANT "DBA" TO simpleUser;
GRANT "CONNECT" TO simpleUser;
GRANT "RESOURCE" TO simpleUser;

GRANT CREATE SESSION TO simpleUser;
GRANT GRANT ANY PRIVILEGE TO simpleUser;