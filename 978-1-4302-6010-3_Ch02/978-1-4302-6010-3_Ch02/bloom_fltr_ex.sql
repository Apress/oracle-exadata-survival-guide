@bing

connect bing/bong0$tar

set echo on

--
-- Set session parameters for parallel execution
--
alter session set parallel_force_local=true;
alter session set parallel_min_time_threshold=2;
alter session set parallel_degree_policy=manual;

spool bloom_filter_example.log

--
-- Create sample tables 
--
-- Create them parallel, necessary
-- to get a Smart Scan on these tables
--
create table emp(
	empid	number,
	empnm	varchar2(40),
	empsal	number,
	empssn	varchar2(12),
	constraint emp_pk primary key (empid)
) parallel 4;

create table emp_dept(
	empid	number,
	empdept	number,
	emploc	varchar2(60),
	constraint emp_dept_pk primary key(empid)
) parallel 4;

create table dept_info(
	deptnum	number,
	deptnm	varchar2(25),
	constraint dept_info_pk primary key(deptnum)
) parallel 4;

--
-- Load sample tables with data
--
begin
	for i in 1..2000000 loop
		insert into emp
		values(i, 'Fnarm'||i, (mod(i, 7)+1)*1000, mod(i,10)||mod(i,10)||mod(i,10)||'-'||mod(i,10)||mod(i,10)||'-'||mod(i,10)||mod(i,10)||mod(i,10)||mod(i,10));
		insert into emp_dept
		values(i, (mod(i,8)+1)*10, 'Zanzwalla'||(mod(i,8)+1)*10);
		commit;
	end loop;
	insert into dept_info
	select distinct empdept, case when empdept = 10 then 'SALES'
				      when empdept = 20 then 'PROCUREMENT'
				      when empdept = 30 then 'HR'
				      when empdept = 40 then 'RESEARCH'
				      when empdept = 50 then 'DEVELOPMENT'
				      when empdept = 60 then 'EMPLOYEE RELATIONS'
				      when empdept = 70 then 'FACILITIES'
				      when empdept = 80 then 'FINANCE' end
	from emp_dept;

end;
/

--
-- Run join query using bloom filter
--
-- Generate execution plan to prove bloom
-- filter usage
--
-- Also report query execution time
--
alter session set tracefile_identifier='bloom';
alter session set events='10046 trace name context forever, level 12';
alter session set events='10051 trace name context forever, level 1';
set autotrace on
set timing on

select /*+ bloom join 2 parallel 2 use_hash(emp emp_dept) */ e.empid, e.empnm, d.deptnm, e.empsal, count(*) emps
from emp e join emp_dept ed on (ed.empid = e.empid) join dept_info d on (ed.empdept = d.deptnum)
where ed.empdept = 20
group by e.empid, e.empnm, d.deptnm, e.empsal;

spool off

set echo off timing off

alter session set events='10046 trace name context off';
alter session set events='10051 trace name context off';
set autotrace off

connect / as sysdba

drop user bing cascade;

