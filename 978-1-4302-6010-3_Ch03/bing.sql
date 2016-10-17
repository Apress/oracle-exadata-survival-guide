set echo on
connect / as sysdba
create user bing identified by bong0$tar
default tablespace users
temporary tablespace temp
quota unlimited on users
quota unlimited on indx;

grant connect, create table, plustrace to bing;
grant alter any procedure to bing;
grant create any procedure to bing;
grant create procedure to bing;
grant debug any procedure to bing;
grant drop any procedure to bing;
grant execute any procedure to bing;
grant create any type to bing;
grant create synonym to bing;
grant create any synonym to bing;
grant create view to bing;
grant execute_catalog_role to bing;
grant create trigger to bing;
grant create sequence to bing;
grant select_catalog_role to bing;
grant alter session to bing;
grant administer any sql tuning set to bing;
grant dba to bing;
grant select on dba_tables to bing;
grant create any materialized view to bing;
grant select_catalog_role to bing;
grant select on aud$ to bing;
grant select on sys.v_$datafile to bing;
grant all on plsql_profiler_runs to bing;
grant all on plsql_profiler_units to bing;
grant all on plsql_profiler_data to bing;
alter user bing default role all;
grant select on sys.ts$ to bing;
grant execute on dbms_crypto to bing;

set echo off

