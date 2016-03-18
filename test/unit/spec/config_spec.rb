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
end
