@bing

connect bing/bong0$tar

set echo on

@demobld_part

begin
	for i in 1..2000 loop
		insert into emp
		select 7099, ename, job, mgr, hiredate, sal, comm, deptno from emp where empno = 7369;
	end loop;

	for j in 1..12 loop
		insert into emp select * from emp;
	end loop;

	commit;
end;
/

set echo on

alter table emp move partition e1 compress for oltp;
alter table emp move partition e2 compress for oltp;
alter table emp move partition e3 compress for oltp;
alter table emp move partition e4 compress for oltp;
alter table emp move partition e5 compress for oltp;
alter table emp move partition e6 compress for oltp;
alter table emp move partition e7 compress for oltp;
alter table emp move partition elast compress for oltp;

select table_name, partition_name, compression, compress_for
from user_tab_partitions;

-- CREATE TABLE EMPHST
       -- (EMPNO NUMBER(4) NOT NULL,
        -- ENAME VARCHAR2(10),
        -- JOB VARCHAR2(9),
        -- MGR NUMBER(4),
        -- HIREDATE DATE,
        -- SAL NUMBER(7, 2),
        -- COMM NUMBER(7, 2),
        -- DEPTNO NUMBER(2))
-- partition by range(empno)
-- (partition history values less than (7300) compress for archive high,
 -- partition e1 values less than (7400) compress for oltp,
 -- partition e2 values less than (7500) compress for oltp,
 -- partition e3 values less than (7600) compress for oltp,
 -- partition e4 values less than (7700) compress for oltp,
 -- partition e5 values less than (7800) compress for oltp,
 -- partition e6 values less than (7900) compress for oltp,
 -- partition e7 values less than (8000) compress for oltp,
 -- partition elast values less than (maxvalue) compress for oltp);

select table_name, partition_name, compression, compress_for
from user_tab_partitions;

-- insert /*+ append */ into emphst select * From emp;

select segment_name, sum(bytes)
from user_segments
group by segment_name;

alter table emp split partition e1 at ('7300') into (partition history, partition e1);
select distinct empno from emp partition(history);
alter table emp move partition history compress for archive low update indexes;

select segment_name, sum(bytes)
from user_segments
group by segment_name;

connect / as sysdba

drop user bing cascade;

