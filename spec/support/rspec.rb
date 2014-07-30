module RSpec
  module FeatureExampleGroup
    def self.included(group)
      group.metadata[:type] = :feature
#       Capybara.app = Reeder::Web.new
    end
  end
end
