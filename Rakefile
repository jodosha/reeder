require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require_relative './config/environment'

RSpec::Core::RakeTask.new(:spec)

task default: :spec

desc 'Application Console'
task :console do
  exec 'bundle exec lotus console --applications=web/application.rb'
end

namespace :db do
  task :migrate do
    require 'reeder/migrator'
    Reeder::Migrator.migrate!
  end

  task seed: :migrate do
    load 'db/seeds.rb'
  end
end
