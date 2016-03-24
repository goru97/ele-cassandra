# encoding: UTF-8
# License:: Apache License, Version 2.0
#

require_relative 'spec_helper'

describe service('cass') do
  it { should be_enabled }
end

describe service('cass') do
  it { should be_running }
end

describe port(9160) do
  it { should be_listening }
end

describe port(9042) do
  it { should be_listening }
end
