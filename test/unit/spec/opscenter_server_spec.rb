require 'chefspec'
require_relative 'spec_helper'

describe 'ele-cassandra::opscenter_server' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it 'includes the `cassandra-dse::opscenter_server` recipe' do
    expect(chef_run).to include_recipe('cassandra-dse::opscenter_server')
  end
end
