require 'reeder'
require_relative './config/environment'
require_relative './web/application'

run Reeder::Web.new
