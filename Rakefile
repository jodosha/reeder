require 'rake'
require 'hanami/rake_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)
task default: :spec

namespace :db do
  desc 'Seed sample data'
  task seed: :environment do
    load 'db/seeds.rb'
  end
end
