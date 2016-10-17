@bing_l2ua

connect bing/bong0$tar

set echo on linesize 200 trimspool on

select inst_id, sid, sql_id, sql_exec_start, sql_plan_hash_value, elapsed_time, cpu_time, fetches, buffer_gets, disk_reads, direct_writes, io_interconnect_bytes, status
from gv$sql_monitor
/

