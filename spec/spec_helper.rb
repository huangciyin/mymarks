$LOAD_PATH << File.dirname(File.dirname(__FILE__))
require 'environment'

require 'capybara'
require 'capybara/dsl'

Capybara.app = Sinatra::Application.new

RSpec.configure do |config|
  config.include Capybara::DSL
end
