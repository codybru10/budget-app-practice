Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
ENV['RACK_ENV'] = 'test'

require("bundler/setup")
Bundler.require(:default, :test)
set(:root, Dir.pwd())

require('capybara/rspec')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('./app')

RSpec.configure do |config|
  config.after(:each) do
    Location.all().each do |location|
      location.destroy()
    end
  end
end
