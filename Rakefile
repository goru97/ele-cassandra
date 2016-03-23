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

desc 'All style checks'
task style: %w(style:chef style:ruby)

desc 'Style and unit tests'
task unit: %w(style spec)

desc 'All tests'
task test: %w(style spec integration:vagrant)

desc 'CI tests'
task ci: %w(style spec integration:cloud)
