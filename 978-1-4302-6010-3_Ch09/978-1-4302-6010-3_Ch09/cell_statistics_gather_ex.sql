@bing

connect bing/bong0$tar

alter session set tracefile_identifier='smort';

alter session set events='10046 trace name context forever, level 12';

select * From v$cell;

select * From v$cell_thread_history;

select * from v$cell_request_totals;

alter session set events='10046 trace name context off';

connect / as sysdba

drop user bing cascade;

!cd $ORACLE_BASE/diag/rdbms; find . -name "*smort*trc" -exec grep statistics {} \\;


