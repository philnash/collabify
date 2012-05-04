require 'sinatra'
require 'erb'

configure :development do
  Redis.current = Redis.new
end

get '/' do
  erb :index
end

get '/search' do
  if params[:query] && !params[:query].empty?
    results = MetaSpotify::Track.search(params[:query])
    @tracks = results[:tracks].select { |t| t.album.is_available_in?('gb') }
    erb :index
  else
    redirect '/'
  end
end

post '/add' do
  Redis.current.rpush 'collabify:tracks', params[:uri]
  redirect '/'
end

post '/clear_queue' do

end

get '/list' do
  length = Redis.current.llen 'collabify:tracks'
  @tracks = Redis.current.lrange 'collabify:tracks', 0, length
  content_type :json
  @tracks.to_json
end

