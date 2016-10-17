--
-- Generate a tabular list of
-- the offloadable functions
--

--
-- Enable output from PL/SQL
--
set serveroutput on size 1000000

--
-- PL/SQL block to generate output
--
declare
	--
	-- Cursor to return all offloadable
	-- functions in the current release
	--
	cursor get_off_fns is
	select name
	from v$sqlfn_metadata
	where offloadable = 'YES'
	order by func_id;

	--
	-- Counter to provide four function
	-- names per line
	--
	colct	number:=0;

	--
	-- String variable to hold
	-- formatted output
	--
	colstr	varchar2(4000);

begin
	--
	-- Loop through the results, putting four
	-- per line, and output the formatted 
	-- string
	--
	for fnrec in get_off_fns loop
		colstr:=colstr||rpad(fnrec.name, 25);
		colct:=colct+1;
		if colct = 4 then
			dbms_output.put_line(colstr);
			colstr:='';
			colct:=0;
		end if;
	end loop;
	--
	-- There may be an odd number of functions
	--
	-- Output the final line  here
	--
	dbms_output.put_line(colstr);
end;
/


