require 'chefspec'
require_relative 'spec_helper'

describe 'ele-cassandra::opscenter_agent' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it 'includes the `cassandra-dse::opscenter_agent` recipe' do
    expect(chef_run).to include_recipe('cassandra-dse::opscenter_agent')
  end
end
