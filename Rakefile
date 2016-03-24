#!/usr/bin/env rake

require 'foodcritic'
require 'rubocop/rake_task'
require 'rspec/core/rake_task'
require 'kitchen'

namespace :style do
  desc 'Ruby style checks'
  RuboCop::RakeTask.new(:ruby)

  desc 'Chef style checks'
  FoodCritic::Rake::LintTask.new(:chef)
end

desc 'Run Food Critic Lint Task'
task :foodcritic do
  puts 'Running Food Critic Lint..'
  FoodCritic::Rake::LintTask.new do |fc|
    fc.options = { :fail_tags => ['correctness'] }
  end
end

# Rspec and ChefSpec
desc 'Run ChefSpec unit tests'
RSpec::Core::RakeTask.new(:spec) do |t, _args|
  t.rspec_opts = 'test/unit'
end

# Rspec and ServerSpec
desc 'Run serverspec integration tests'
RSpec::Core::RakeTask.new(:serverspec) do |t, _args|
  t.rspec_opts = 'test/integration'
end

# Integration tests. Kitchen.ci
namespace :integration do
  desc 'Test Kitchen with Vagrant'
  task :vagrant do
    Kitchen.logger = Kitchen.default_file_logger
    Kitchen::Config.new.instances.each do |instance|
      instance.test(:always)
    end
  end

  desc 'Test Kitchen with cloud plugins'
  task :cloud do
    if ENV['CI'] == 'true'
      Kitchen.logger = Kitchen.default_file_logger
      @loader = Kitchen::Loader::YAML.new(local_config: '.kitchen.cloud.yml')
      config = Kitchen::Config.new(loader: @loader)
      concurrency = config.instances.size
      queue = Queue.new
      config.instances.each { |i| queue << i }
      concurrency.times { queue << nil }
      threads = []
      concurrency.times do
        threads << Thread.new do
          while (instance = queue.pop)
            instance.test(:always)
          end
        end
      end
      threads.map(&:join)
    end
  end
end

desc 'All style checks'
task style: %w(style:chef style:ruby)

desc 'Style and unit tests'
task unit: %w(style spec)

desc 'All tests'
task test: %w(style spec integration:vagrant)

desc 'CI tests'
task ci: %w(style spec integration:cloud)
