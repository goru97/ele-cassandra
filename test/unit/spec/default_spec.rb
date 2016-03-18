require 'chefspec'
require_relative 'spec_helper'

describe 'ele-cassandra::default' do
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
end
