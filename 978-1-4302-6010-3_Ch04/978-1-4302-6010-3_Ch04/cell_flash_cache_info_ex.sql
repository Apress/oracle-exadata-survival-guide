@bing

connect bing/bong0$tar

@demobld_rd

set echo on

set long 50000

select dbms_metadata.get_ddl('TABLE','EMP','BING')
from dual;

connect / as sysdba

drop user bing cascade;

