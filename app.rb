require("bundler/setup")
require("pry")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @locations = Location.all
  erb(:index)
end

post('/add_location') do
  location_name = params[:pac_input]
  location_date = params[:date]
  @location = Location.create({:name => location_name, :date => location_date})
  @locations = Location.all
  redirect('/')
end
