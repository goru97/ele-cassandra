require 'chefspec'
require_relative 'spec_helper'

describe 'ele-cassandra::tarball' do

  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it 'includes the `cassandra-dse::tarball` recipe' do
    expect(chef_run).to include_recipe('cassandra-dse::tarball')
  end
end