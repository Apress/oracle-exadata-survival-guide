@bing

connect bing/bong0$tar
set echo on
alter session set parallel_force_local=true;
alter session set parallel_min_time_threshold=2;
alter session set parallel_degree_policy=manual;

spool storage_index_ex.log

create table chicken_hr_tab(
	chicken_id	number not null,
	chicken_name	varchar2(20),
	talent_cd	number not null,
	retired		varchar2(3),
	retire_dt	date,
	suitable_for_frying varchar2(3),
	fry_dt		date
) parallel (degree 4) tablespace users;

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
values ('Flower',4,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Eunice',1,'No',null,'Yes',sysdate+20)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Ginger',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Red',2,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Melony',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Maude',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Fran',1,'No',null,'Yes',sysdate-3)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Fern',2,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Amanda',1,'Yes',sysdate-1,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Colleen',4,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Peggy',2,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Danni',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Martha',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Dolly',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Periwinkle',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Uma',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Amanda',2,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Florence',3,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Pickles',1,'No',null,'Yes',sysdate+12)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Pepper',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Frieda',4,'No',null,'Yes',sysdate+30)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Terri',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Cloris',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Terry',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Snookums',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Margot',2,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Lois',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Lola',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Beulah',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Merle',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Stava',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Stephanie',2,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Edie',2,'No',null,'Yes',sysdate+30)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Calcutta',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Jane',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Crystal',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Loretta',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Monica',2,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Jennifer',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Julia',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Ruth',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Eva',2,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Marie',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Constance',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Leone',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Leona',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Dana',2,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Luba',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Rachel',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Sarah',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Amy',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Rebecca',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Cat',5,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Katy',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Scarlett',4,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Ashley',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Belle',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Delle',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Delilah',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Mary',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Margaret',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Lucy',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Rona',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Reese',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Agnes',2,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Donna',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Melissa',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Melba',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Hazel',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Phyllis',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Matilda',1,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Rhonda',2,'No',null,'No',null)
into chicken_hr_tab (chicken_name, talent_cd, retired, retire_dt, suitable_for_frying, fry_dt)
values ('Vicki',1,'No',null,'No',null)
select * from dual;

commit;

alter session set "_serial_direct_read"=true;

begin
	for i in 1..19 loop
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

select * 
from v$mystat
where statistic# = (select statistic# from v$statname where name = 'cell physical IO bytes saved by storage index');

select /*+ parallel(4) */
h.chicken_name, t.talent, h.suitable_for_frying
from chicken_hr_tab h join chicken_talent_tab t on (t.talent_cd = h.talent_cd)
where h.talent_cd = 5;

select * 
from v$mystat
where statistic# = (select statistic# from v$statname where name = 'cell physical IO bytes saved by storage index');

connect bing/bong0$tar

select /*+ parallel(4) */
count(*)
from chicken_hr_tab
where suitable_for_frying = 'Yes';

select * 
from v$mystat
where statistic# = (select statistic# from v$statname where name = 'cell physical IO bytes saved by storage index');

connect bing/bong0$tar

select /*+ parallel(4) */
chicken_id, chicken_name, suitable_for_frying
from chicken_hr_tab
where suitable_for_frying = 'Yes';

select * 
from v$mystat
where statistic# = (select statistic# from v$statname where name = 'cell physical IO bytes saved by storage index');

connect bing/bong0$tar

select /*+ parallel(4) */
h.chicken_name, t.talent, h.suitable_for_frying
from chicken_hr_tab h join chicken_talent_tab t on (t.talent_cd = h.talent_cd)
where h.talent_cd = 5;

select * 
from v$mystat
where statistic# = (select statistic# from v$statname where name = 'cell physical IO bytes saved by storage index');

spool off
connect / as sysdba

drop user bing cascade;

