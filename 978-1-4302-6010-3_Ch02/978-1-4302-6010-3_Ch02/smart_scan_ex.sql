@bing

connect bing/bong0$tar

set linesize 2000 trimspool on
column sql_text format a45
column projection format a60

show parameter offload

alter session set "_serial_direct_read"=true;
alter session set parallel_degree_limit=4;
alter session set parallel_min_time_threshold=1;

create table emp (empid number not null,
		  empname varchar2(40),
		  deptno	number);

begin
	for i in 1..5000000 loop
		insert into emp
		values (i, 'Smorthorper'||i, mod(i, 40)+1);
	end loop;

	commit;
end;
/

set echo on

exec dbms_stats.gather_schema_stats('BING')

set autotrace on timing on

select * 
from emp
where empid = 7934;

set autotrace off timing off

select  sql_id,
	io_cell_offload_eligible_bytes qualifying,
	io_cell_offload_returned_bytes actual,
	round(((io_cell_offload_eligible_bytes - io_cell_offload_returned_bytes)/io_cell_offload_eligible_bytes)*100, 2) io_saved_pct,
	sql_text
from v$sql
where io_cell_offload_returned_bytes > 0
and instr(sql_text, 'emp') > 0
and parsing_schema_name = 'BING';

select sql_id,
       projection
from v$sql_plan
where sql_id = 'gfjb8dpxvpuv6';

select *
from table(dbms_xplan.display_cursor('&sql_id','&child_no', '+projection'));

create index empid_idx on emp(empid);

set autotrace on timing on

select * 
from emp
where empid = 7934;

set autotrace off timing off

select  sql_id,
	io_cell_offload_eligible_bytes qualifying,
	io_cell_offload_returned_bytes actual,
	round(((io_cell_offload_eligible_bytes - io_cell_offload_returned_bytes)/io_cell_offload_eligible_bytes)*100, 2) io_saved_pct,
	sql_text
from v$sql
where io_cell_offload_returned_bytes > 0
and instr(sql_text, 'emp') > 0
and parsing_schema_name = 'BING';

connect / as sysdba

drop user bing cascade;

