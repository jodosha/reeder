require_relative '../../apps/web/application'

module RSpec
  module FeatureExampleGroup
    def self.included(group)
      group.metadata[:type] = :feature
      Capybara.app = Reeder::Web.new
    end
  end
end
