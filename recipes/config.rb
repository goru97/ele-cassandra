if node['cassandra']['version'] < '2.0'
  ruby_block 'smash >= 2.1-attributes' do
    block do
      node.rm('cassandra', 'config', 'broadcast_rpc_address')
      node.rm('cassandra', 'config', 'tombstone_failure_threshold')
      node.rm('cassandra', 'config', 'tombstone_warn_threshold')
      node.rm('cassandra', 'config', 'sstable_preemptive_open_interval_in_mb')
      node.rm('cassandra', 'config', 'memtable_allocation_type')
      node.rm('cassandra', 'config', 'index_summary_capacity_in_mb')
      node.rm('cassandra', 'config', 'index_summary_resize_interval_in_minutes')
      node.rm('cassandra', 'config', 'concurrent_counter_writes')
      node.rm('cassandra', 'config', 'counter_cache_save_period')
      node.rm('cassandra', 'config', 'counter_cache_size_in_mb')
      node.rm('cassandra', 'config', 'counter_write_request_timeout_in_ms')
      node.rm('cassandra', 'config', 'commit_failure_policy')
      node.rm('cassandra', 'config', 'cas_contention_timeout_in_ms')
      node.rm('cassandra', 'config', 'batch_size_warn_threshold_in_kb')
      node.rm('cassandra', 'config', 'batchlog_replay_throttle_in_kb')
      node.rm('cassandra', 'config', 'permissions_validity_in_ms')
    end
  end
end

# C* 2.1.0
if node['cassandra']['version'] >= '2.1'
  ruby_block 'smash < 2.0-attributes' do
    block do
      node.rm('cassandra', 'config', 'memtable_flush_queue_size')
      node.rm('cassandra', 'config', 'in_memory_compaction_limit_in_mb')
      node.rm('cassandra', 'config', 'concurrent_compactors')
      node.rm('cassandra', 'config', 'multithreaded_compaction')
      node.rm('cassandra', 'config', 'compaction_preheat_key_cache')
      node.rm('cassandra', 'config', 'native_transport_min_threads')
      node.rm('cassandra', 'config', 'native_transport_max_threads')
    end
  end
end
include_recipe 'cassandra-dse::config'
