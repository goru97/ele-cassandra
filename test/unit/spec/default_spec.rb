require 'chefspec'
require_relative 'spec_helper'

describe 'ele-cassandra::spec' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it 'includes the `apt` recipe' do
    expect(chef_run).to include_recipe('apt')
  end

  it 'includes the `java` recipe' do
    expect(chef_run).to include_recipe('java')
  end

  it 'includes the `python` recipe' do
    expect(chef_run).to include_recipe('python')
  end

  it 'includes the `python::pip` recipe' do
    expect(chef_run).to include_recipe('python::pip')
  end

  it 'includes the `ele-cassandra::tarball` recipe' do
    expect(chef_run).to include_recipe('ele-cassandra::tarball')
  end

  it 'includes the `ele-cassandra::config` recipe' do
    expect(chef_run).to include_recipe('ele-cassandra::config')
  end

  it 'installs a python pip package cql' do
    expect(chef_run).to install_python_pip('cql')
  end

  it 'sets expected spec attributes' do
    expect(chef_run.node['cassandra']['jmx_port']).to eq(9080)
    expect(chef_run.node['cassandra']['user']).to eq('daemon')
    expect(chef_run.node['cassandra']['group']).to eq('daemon')
    expect(chef_run.node['cassandra']['service_name']).to eq('cass')
    expect(chef_run.node['cassandra']['install_method']).to eq('tarball')
    expect(chef_run.node['cassandra']['jamm']['version']).to eq('0.2.5')
    expect(chef_run.node['cassandra']['jamm']['base_url']).to eq('http://repo1.maven.org/maven2/com/github/jbellis/jamm/0.2.5')
  end

  it 'sets expected spec opscenter/datastax-agent attributes' do
    expect(chef_run.node['cassandra']['opscenter']['version']).to eq('5.1.4')
    expect(chef_run.node['cassandra']['opscenter']['server']['port']).to eq('8888')
    expect(chef_run.node['cassandra']['opscenter']['agent']['version']).to eq('5.2.4')
    expect(chef_run.node['cassandra']['opscenter']['agent']['package_name']).to eq('datastax-agent')
    expect(chef_run.node['cassandra']['opscenter']['agent']['download_url']).to eq('http://downloads.datastax.com/community/datastax-agent-5.2.4.tar.gz')
  end
end
