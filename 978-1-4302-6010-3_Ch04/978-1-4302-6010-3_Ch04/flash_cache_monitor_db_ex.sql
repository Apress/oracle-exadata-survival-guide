@gribnaut

connect gribnaut/yapuda$1

@demobld_rd

set echo on

begin
	for i in 1..19 loop
		insert into emp
		select * from emp;
		commit;
	end loop;

end;
/

column value new_value beginval

select statistic#, value
from v$mystat
where statistic# in (select statistic# from v$statname where name = 'cell flash cache read hits');

select count(*)
from emp;

column  val new_value endval

select statistic#, value val
from v$mystat
where statistic# in (select statistic# from v$statname where name = 'cell flash cache read hits');

select &endval - &beginval flash_hits
from dual;

connect / as sysdba

drop user gribnaut cascade;

