require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  @bands = Band.all()
  @venues = Venue.all()
  erb(:index)
end

post '/bands' do
  name = params.fetch("name")
  @band = Band.create({:name => name})
  redirect '/'
end

post '/venues' do
  venue_name = params.fetch("venue_name")
  @venue = Venue.create({:name => venue_name})
  redirect '/'
end

get '/bands/:id' do
  @band = Band.find(params.fetch("id").to_i)
  @venues = Venue.all()
  erb(:band)
end

post("/bands/:id") do
  band_id = params.fetch("id").to_i()
  @band = Band.find(band_id)
  venue_ids = params.fetch("venue_ids")
  @band.update({:venue_ids => venue_ids})
  @venues = Venue.all()
  redirect("/bands/#{@band.id}")
end
