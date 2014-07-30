require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: :spec

namespace :db do
  task migrate: :environment do
    require 'reeder/migrator'
    Reeder::Migrator.migrate!
  end
end

task :environment do
  ENV['RACK_ENV'] = ENV['LOTUS_ENV'] ||= 'development'
  require 'dotenv/deployment'
end
