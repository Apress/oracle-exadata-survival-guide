@bing

connect bing/bong0$tar
set echo on
alter session set parallel_force_local=true;
alter session set parallel_min_time_threshold=2;
alter session set parallel_degree_policy=manual;

spool storage_index_part_ex.log

create table chicken_hr_tab(
	chicken_id	number not null,
	chicken_name	varchar2(20),
	talent_cd	number not null,
	retired		varchar2(3),
	retire_dt	date,
	suitable_for_frying varchar2(3),
	fry_dt		date
) parallel (degree 4) tablespace users
partition by range (talent_cd)
(partition chick1 values less than (2),
 partition chick2 values less than (3),
 partition chick3 values less than (4),
 partition chick4 values less than (5),
 partition chick5 values less than (maxvalue));

create table chicken_talent_tab(
	talent_cd	number not null,
	talent		varchar2(40)
) parallel (degree 4) tablespace users;

create sequence chick_id_seq start with 1 increment by 1 nomaxvalue nocycle noorder;

create or replace trigger chick_id_trg
before insert on chicken_hr_tab
for each row
begin
	:new.chicken_id := chick_id_seq.nextval;
end;
/

insert all
into chicken_talent_tab
values(1, 'Paint Stripper')
into chicken_talent_tab
values(2, 'Tap Dancer')
into chicken_talent_tab
values(3, 'Medic')
into chicken_talent_tab
values(4, 'Pole Vaulter')
into chicken_talent_tab
values(5, 'Accountant')
select * from dual;

commit;

insert all
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Peaches',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Flower',2,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Eunice',3,'No',null,'Yes',sysdate+20)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Ginger',4,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Red',5,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Melony',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Maude',2,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Fran',3,'No',null,'Yes',sysdate-3)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Fern',4,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Amanda',5,'Yes',sysdate-1,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Colleen',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Peggy',2,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Danni',3,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Martha',4,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Dolly',5,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Periwinkle',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Uma',2,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Amanda',3,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Florence',4,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Pickles',5,'No',null,'Yes',sysdate+12)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Pepper',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Frieda',2,'No',null,'Yes',sysdate+30)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Terri',3,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Cloris',4,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Terry',5,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Snookums',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Margot',2,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Lois',3,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Lola',4,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Beulah',5,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Merle',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Stava',2,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Stephanie',3,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Edie',4,'No',null,'Yes',sysdate+30)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Calcutta',5,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Jane',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Crystal',2,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Loretta',3,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Monica',4,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Jennifer',5,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Julia',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Ruth',2,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Eva',3,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Marie',4,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Constance',5,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Leone',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Leona',2,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Dana',3,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Luba',4,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Rachel',5,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Sarah',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Amy',2,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Rebecca',3,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Cat',4,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Katy',5,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Scarlett',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Ashley',2,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Belle',3,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Delle',4,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Delilah',5,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Mary',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Margaret',2,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Lucy',3,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Rona',4,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Reese',5,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Agnes',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Donna',2,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Melissa',3,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Melba',4,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Hazel',5,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Phyllis',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Matilda',2,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Rhonda',3,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Vicki',4,'No',null,'No',null)
select * from dual;

commit;

alter session set "_serial_direct_read"=true;

begin
	for i in 1..17 loop
		insert /*+ append */
		into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
		select
		chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt from chicken_hr_tab
		where suitable_for_frying='No';
		commit;
		insert /*+ append */
		into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
		select
		chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt from chicken_hr_tab
		where suitable_for_frying='Yes';
		commit;
	end loop;

	commit;

end;
/
		
exec dbms_stats.gather_table_stats(user, 'CHICKEN_TALENT_TAB', cascade=>true, estimate_percent=>null);
exec dbms_stats.gather_table_stats(user, 'CHICKEN_HR_TAB', cascade=>true, estimate_percent=>null);

select count(*) from chicken_hr_tab partition(chick1);
select count(*) from chicken_hr_tab partition(chick2);
select count(*) from chicken_hr_tab partition(chick3);
select count(*) from chicken_hr_tab partition(chick4);
select count(*) from chicken_hr_tab partition(chick5);

oolumn segment_name format a30

select segment_name, count(*) extents, sum(bytes) ttl_bytes
from user_extents
group by segment_name;

select /*+ parallel(4) */
count(*)
from chicken_hr_tab
where suitable_for_frying = 'Yes';

select * 
from v$mystat
where statistic# = (select statistic# from v$statname where name = 'cell physical IO bytes saved by storage index');

select /*+ parallel(4) */
chicken_id, chicken_name, suitable_for_frying
from chicken_hr_tab
where suitable_for_frying = 'Yes';

select  sql_id,
        io_cell_offload_eligible_bytes qualifying,
        io_cell_offload_eligible_bytes - io_cell_offload_returned_bytes actual,
        round(((io_cell_offload_eligible_bytes - io_cell_offload_returned_bytes)/io_cell_offload_eligible_bytes)*100, 2) io_saved_pct,
        sql_text
from v$sql
where io_cell_offload_returned_bytes > 0
and instr(sql_text, 'emp') > 0
and parsing_schema_name = 'BING';

select * 
from v$mystat
where statistic# = (select statistic# from v$statname where name = 'cell physical IO bytes saved by storage index');

select /*+ parallel(4) */
h.chicken_name, t.talent, h.suitable_for_frying
from chicken_hr_tab h join chicken_talent_tab t on (t.talent_cd = h.talent_cd)
where h.talent_cd = 5;

select  sql_id,
        io_cell_offload_eligible_bytes qualifying,
        io_cell_offload_eligible_bytes - io_cell_offload_returned_bytes actual,
        round(((io_cell_offload_eligible_bytes - io_cell_offload_returned_bytes)/io_cell_offload_eligible_bytes)*100, 2) io_saved_pct,
        sql_text
from v$sql
where io_cell_offload_returned_bytes > 0
and instr(sql_text, 'emp') > 0
and parsing_schema_name = 'BING';

select * 
from v$mystat
where statistic# = (select statistic# from v$statname where name = 'cell physical IO bytes saved by storage index');

connect bing/bong0$tar

select /*+ parallel(4) */
count(*)
from chicken_hr_tab
where suitable_for_frying = 'Yes';

select  sql_id,
        io_cell_offload_eligible_bytes qualifying,
        io_cell_offload_eligible_bytes - io_cell_offload_returned_bytes actual,
        round(((io_cell_offload_eligible_bytes - io_cell_offload_returned_bytes)/io_cell_offload_eligible_bytes)*100, 2) io_saved_pct,
        sql_text
from v$sql
where io_cell_offload_returned_bytes > 0
and instr(sql_text, 'emp') > 0
and parsing_schema_name = 'BING';

select * 
from v$mystat
where statistic# = (select statistic# from v$statname where name = 'cell physical IO bytes saved by storage index');

connect bing/bong0$tar

select /*+ parallel(4) */
sum(chicken_id)
from chicken_hr_tab
where suitable_for_frying = 'Yes';

select  sql_id,
        io_cell_offload_eligible_bytes qualifying,
        io_cell_offload_eligible_bytes - io_cell_offload_returned_bytes actual,
        round(((io_cell_offload_eligible_bytes - io_cell_offload_returned_bytes)/io_cell_offload_eligible_bytes)*100, 2) io_saved_pct,
        sql_text
from v$sql
where io_cell_offload_returned_bytes > 0
and instr(sql_text, 'emp') > 0
and parsing_schema_name = 'BING';

select * 
from v$mystat
where statistic# = (select statistic# from v$statname where name = 'cell physical IO bytes saved by storage index');

connect bing/bong0$tar

select /*+ parallel(4) */
chicken_id, chicken_name, suitable_for_frying
from chicken_hr_tab
where suitable_for_frying = 'Yes';

select  sql_id,
        io_cell_offload_eligible_bytes qualifying,
        io_cell_offload_eligible_bytes - io_cell_offload_returned_bytes actual,
        round(((io_cell_offload_eligible_bytes - io_cell_offload_returned_bytes)/io_cell_offload_eligible_bytes)*100, 2) io_saved_pct,
        sql_text
from v$sql
where io_cell_offload_returned_bytes > 0
and instr(sql_text, 'emp') > 0
and parsing_schema_name = 'BING';

select * 
from v$mystat
where statistic# = (select statistic# from v$statname where name = 'cell physical IO bytes saved by storage index');

connect bing/bong0$tar

select /*+ parallel(4) */
h.chicken_name, t.talent, h.suitable_for_frying
from chicken_hr_tab h join chicken_talent_tab t on (t.talent_cd = h.talent_cd)
where h.talent_cd = 5;

select  sql_id,
        io_cell_offload_eligible_bytes qualifying,
        io_cell_offload_eligible_bytes - io_cell_offload_returned_bytes actual,
        round(((io_cell_offload_eligible_bytes - io_cell_offload_returned_bytes)/io_cell_offload_eligible_bytes)*100, 2) io_saved_pct,
        sql_text
from v$sql
where io_cell_offload_returned_bytes > 0
and instr(sql_text, 'emp') > 0
and parsing_schema_name = 'BING';

select * 
from v$mystat
where statistic# = (select statistic# from v$statname where name = 'cell physical IO bytes saved by storage index');

spool off
connect / as sysdba

drop user bing cascade;

