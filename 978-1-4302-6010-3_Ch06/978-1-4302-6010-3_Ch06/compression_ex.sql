@bing

connect bing/bong0$tar

alter session force parallel dml parallel 8;
alter session set db_lost_write_protect=none;

@demobld

create index emp_idx on emp(empno);

begin
	for i in 1..20 loop
		insert into emp select * From emp;
		commit;
	end loop;

	commit;

end;
/

set echo on timing on
column segment_name format a35

--
-- Current storage for the EMP table
-- (this is simply a test table for this example)
--
select segment_name, sum(bytes) total_space
from user_segments
group by segment_name;

--
-- Compress the table for query high (use HCC)
--
-- Note elapsed time to compress
--
alter table emp move compress for query high;

--
-- Index is now invalid
--
-- Must rebuild to make it usable
--
-- Note elapsed time
--
alter index emp_idx rebuild;

--
-- Current compression type, storage for table/index
-- initially after compression is enabled
--
select table_name, compression, compress_for
from user_tables;

select segment_name, sum(bytes) total_space
from user_segments
group by segment_name;

--
-- Perform an update on the compressed data
--
-- Note elapsed time to complete
--
update emp set sal=sal*1.08 where empno > 7350;

commit;

--
-- Compression type has not changed in the
-- data dictionary but the consumed space
-- has increased to the level of a table
-- initially compressed for OLTP
--
select table_name, compression, compress_for
from user_tables;

select segment_name, sum(bytes) total_space
from user_segments
group by segment_name;

--
-- Perform a second update
--
-- Note elapsed time
--
update emp set sal=sal*1.08 where empno > 7350;

commit;

--
-- Current storage consumed after second update
--
select table_name, compression, compress_for
from user_tables;

select segment_name, sum(bytes) total_space
from user_segments
group by segment_name;

--
-- Let's start over
--
@demobld

create index emp_idx on emp(empno);

begin
	for i in 1..20 loop
		insert into emp select * From emp;
		commit;
	end loop;

	commit;

end;
/

--
-- Initial storage
--
select segment_name, sum(bytes) total_space
from user_segments
group by segment_name;

--
-- Compress for OLTP rather than QUERY HIGH
--
-- Note elapsed time
--
alter table emp move compress for oltp;
   
alter index emp_idx rebuild;

--
-- These figures are the same as those generated
-- AFTER the HCC compressed data was updated the first time
--
select table_name, compression, compress_for
from user_tables;

select segment_name, sum(bytes) total_space
from user_segments
group by segment_name;

--
-- Perform an update
--
-- Note elapsed time (less than the previous compressed update)
--
update emp set sal=sal*1.08 where empno > 7350;

commit;

--
-- Current compression level and storage
--
-- Looks like the storage after the second
-- update to the HCC compressed data
--
select table_name, compression, compress_for
from user_tables;

select segment_name, sum(bytes) total_space
from user_segments
group by segment_name;

--
-- Let's start again, this time with reverse-key indexes
--
@demobld

create index emp_idx on emp(empno) reverse;

begin
	for i in 1..20 loop
		insert into emp select * From emp;
		commit;
	end loop;

	commit;

end;
/

set echo on timing on
column segment_name format a35

--
-- Current storage for the EMP table
-- (this is simply a test table for this example)
--
select segment_name, sum(bytes) total_space
from user_segments
group by segment_name;

--
-- Compress the table for query high (use HCC)
--
-- Note elapsed time to compress
--
alter table emp move compress for query high;

--
-- Index is now invalid
--
-- Must rebuild to make it usable
--
-- Note elapsed time
--
alter index emp_idx rebuild;

--
-- Current compression type, storage for table/index
-- initially after compression is enabled
--
select table_name, compression, compress_for
from user_tables;

select segment_name, sum(bytes) total_space
from user_segments
group by segment_name;

--
-- Perform an update on the compressed data
--
-- Note elapsed time to complete
--
update emp set sal=sal*1.08 where empno > 7350;

commit;

--
-- Compression type has not changed in the
-- data dictionary but the consumed space
-- has increased to the level of a table
-- initially compressed for OLTP
--
select table_name, compression, compress_for
from user_tables;

select segment_name, sum(bytes) total_space
from user_segments
group by segment_name;

--
-- Perform a second update
--
-- Note elapsed time
--
update emp set sal=sal*1.08 where empno > 7350;

commit;

--
-- Current storage consumed after second update
--
select table_name, compression, compress_for
from user_tables;

select segment_name, sum(bytes) total_space
from user_segments
group by segment_name;

--
-- Let's start over
--
@demobld

create index emp_idx on emp(empno) reverse;

begin
	for i in 1..20 loop
		insert into emp select * From emp;
		commit;
	end loop;

	commit;

end;
/

--
-- Initial storage
--
select segment_name, sum(bytes) total_space
from user_segments
group by segment_name;

--
-- Compress for OLTP rather than QUERY HIGH
--
-- Note elapsed time
--
alter table emp move compress for oltp;
   
alter index emp_idx rebuild;

--
-- These figures are the same as those generated
-- AFTER the HCC compressed data was updated the first time
--
select table_name, compression, compress_for
from user_tables;

select segment_name, sum(bytes) total_space
from user_segments
group by segment_name;

--
-- Perform an update
--
-- Note elapsed time (less than the previous compressed update)
--
update emp set sal=sal*1.08 where empno > 7350;

commit;

--
-- Current compression level and storage
--
-- Looks like the storage after the second
-- update to the HCC compressed data
--
select table_name, compression, compress_for
from user_tables;

select segment_name, sum(bytes) total_space
from user_segments
group by segment_name;

connect / as sysdba

drop user bing cascade;

