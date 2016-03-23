require 'chefspec'
require_relative 'spec_helper'

describe 'ele-cassandra::config' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it 'executes the ruby block smash >= 2.1-attributes' do
    expect(chef_run).to run_ruby_block('smash >= 2.1-attributes')
  end

  it 'does not executes the ruby block smash < 2.0-attributes' do
    expect(chef_run).to_not run_ruby_block('smash < 2.0-attributes')
  end

  it 'includes the `cassandra-dse::config` recipe' do
    expect(chef_run).to include_recipe('cassandra-dse::config')
  end
  it 'sets expected config attributes' do
    expect(chef_run.node['cassandra']['config']['memtable_flush_queue_size']).to eq(4)
    expect(chef_run.node['cassandra']['config']['in_memory_compaction_limit_in_mb']).to eq(64)
    expect(chef_run.node['cassandra']['config']['concurrent_compactors']).to eq(nil)
    expect(chef_run.node['cassandra']['config']['multithreaded_compaction']).to eq(false)
    expect(chef_run.node['cassandra']['config']['compaction_preheat_key_cache']).to eq(true)
    expect(chef_run.node['cassandra']['config']['native_transport_min_threads']).to eq(nil)
    expect(chef_run.node['cassandra']['config']['native_transport_max_threads']).to eq(nil)
  end
end
