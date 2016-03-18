include_attribute 'cassandra-dse::config'

default['cassandra']['config']['cluster_name'] = 'data'
default['cassandra']['config']['partitioner'] = 'org.apache.cassandra.dht.RandomPartitioner'
default['cassandra']['config']['concurrent_reads'] = 32 # suggested at 16 * number of drives
default['cassandra']['config']['concurrent_writes'] = 32 # suggested at 8 * number of cpu cores
default['cassandra']['config']['listen_address'] = node['ipaddress']
default['cassandra']['config']['broadcast_address'] = node['ipaddress']
default['cassandra']['config']['rpc_address'] = '0.0.0.0'
default['cassandra']['config']['rpc_port'] = '9160'
default['cassandra']['config']['storage_port'] = 7000
default['cassandra']['config']['ssl_storage_port'] = 7001
default['cassandra']['config']['native_transport_port'] = '9042'
if node['cassandra']['version'] < '2.0'
  default['cassandra']['config']['memtable_flush_queue_size'] = 4
  default['cassandra']['config']['in_memory_compaction_limit_in_mb'] = 64
  default['cassandra']['config']['concurrent_compactors'] = nil
  default['cassandra']['config']['multithreaded_compaction'] = false
  default['cassandra']['config']['compaction_preheat_key_cache'] = true
  default['cassandra']['config']['native_transport_min_threads'] = nil
  default['cassandra']['config']['native_transport_max_threads'] = nil
end

default['cassandra']['config']['start_native_transport'] = true
default['cassandra']['config']['start_rpc'] = true
default['cassandra']['config']['rpc_keepalive'] = true
default['cassandra']['config']['rpc_server_type'] = 'sync' # 'sync' or 'hsha'
default['cassandra']['config']['rpc_min_threads'] = 16
default['cassandra']['config']['rpc_max_threads'] = 2048
default['cassandra']['config']['thrift_framed_transport_size_in_mb'] = 15
default['cassandra']['config']['thrift_max_message_length_in_mb'] = 16
default['cassandra']['config']['incremental_backups'] = false
default['cassandra']['config']['snapshot_before_compaction'] = false
default['cassandra']['config']['auto_snapshot'] = true
default['cassandra']['config']['column_index_size_in_kb'] = 64
default['cassandra']['config']['compaction_throughput_mb_per_sec'] = 16
default['cassandra']['config']['read_request_timeout_in_ms'] = 30_000
default['cassandra']['config']['range_request_timeout_in_ms'] = 30_000
default['cassandra']['config']['write_request_timeout_in_ms'] = 30_000
default['cassandra']['config']['truncate_request_timeout_in_ms'] = 60_000
default['cassandra']['config']['request_timeout_in_ms'] = 30_000
default['cassandra']['config']['endpoint_snitch'] = 'RackInferringSnitch' # endpoint_snitch config

# C* 2.1.0
if node['cassandra']['version'] >= '2.1'
  default['cassandra']['config']['broadcast_rpc_address'] = node['ipaddress']
  default['cassandra']['config']['tombstone_failure_threshold'] = 100_000
  default['cassandra']['config']['tombstone_warn_threshold'] = 1000
  default['cassandra']['config']['sstable_preemptive_open_interval_in_mb'] = 50
  default['cassandra']['config']['memtable_allocation_type'] = 'heap_buffers'
  default['cassandra']['config']['index_summary_capacity_in_mb'] = nil
  default['cassandra']['config']['index_summary_resize_interval_in_minutes'] = 60
  default['cassandra']['config']['concurrent_counter_writes'] = 32
  default['cassandra']['config']['counter_cache_save_period'] = 7200
  default['cassandra']['config']['counter_cache_size_in_mb'] = nil
  default['cassandra']['config']['counter_write_request_timeout_in_ms'] = 5000
  default['cassandra']['config']['commit_failure_policy'] = 'stop'
  default['cassandra']['config']['cas_contention_timeout_in_ms'] = 1000
  default['cassandra']['config']['batch_size_warn_threshold_in_kb'] = 5
  default['cassandra']['config']['batchlog_replay_throttle_in_kb'] = 1024
end
