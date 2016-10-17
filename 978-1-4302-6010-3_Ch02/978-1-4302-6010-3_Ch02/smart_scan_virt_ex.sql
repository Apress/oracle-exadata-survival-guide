@bing

connect bing/bong0$tar

set linesize 2000 trimspool on
column sql_text format a45
column projection format a60

show parameter offload

alter session set "_serial_direct_read"=true;
alter session set parallel_degree_limit=4;
alter session set parallel_min_time_threshold=1;
alter session set parallel_degree_policy=manual;

set echo on

create table emp (empid number not null,
		  empname varchar2(40),
		  deptno	number,
		  sal		number,
		  comm		number,
		  ttl_comp	number generated always as (sal + nvl(comm, 0)) virtual );

begin
	for i in 1..5000000 loop
		insert into emp(empid, empname, deptno, sal, comm)
		values (i, 'Smorthorper'||i, mod(i, 40)+1, 900*(mod(i,4)+1), 200*mod(i,9));
	end loop;

	commit;
end;
/

set echo on

exec dbms_stats.gather_schema_stats('BING')

set autotrace on timing on

select * 
from emp
where ttl_comp > 5000;

set autotrace off timing off

select  sql_id,
	io_cell_offload_eligible_bytes qualifying,
	io_cell_offload_eligible_bytes - io_cell_offload_returned_bytes actual,
	round(((io_cell_offload_eligible_bytes - io_cell_offload_returned_bytes)/io_cell_offload_eligible_bytes)*100, 2) io_saved_pct,
	sql_text
from v$sql
where io_cell_offload_returned_bytes > 0
and instr(sql_text, 'emp') > 0
and parsing_schema_name = 'BING';

select sql_id,
       projection
from v$sql_plan
where sql_id = '6vzxd7wn8858v';

select *
from table(dbms_xplan.display_cursor('6vzxd7wn8858v','0', '+projection'));

update emp
set comm=2000
where sal=3600
and mod(empid, 3) = 0;

commit;

set autotrace on timing on

select * 
from emp
where ttl_comp > 5200;

set autotrace off timing off

select  sql_id,
	io_cell_offload_eligible_bytes qualifying,
	io_cell_offload_eligible_bytes - io_cell_offload_returned_bytes actual,
	round(((io_cell_offload_eligible_bytes - io_cell_offload_returned_bytes)/io_cell_offload_eligible_bytes)*100, 2) io_saved_pct,
	sql_text
from v$sql
where io_cell_offload_returned_bytes > 0
and instr(sql_text, 'emp') > 0
and parsing_schema_name = 'BING';

select sql_id,
       projection
from v$sql_plan
where sql_id = '&sql_id';

select *
from table(dbms_xplan.display_cursor('&sql_id','0', '+projection'));

connect / as sysdba

drop user bing cascade;

