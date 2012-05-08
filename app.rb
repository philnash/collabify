require 'sinatra'
require 'erb'
require 'rack-flash'

use Rack::Flash
enable :sessions
set :protection, except: :session_hijacking

configure :development do
  Redis.current = Redis.new
end
configure :production do
  uri = URI.parse(ENV["REDISTOGO_URL"])
  Redis.current = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
end

get '/' do
  erb :index
end

get '/search' do
  if params[:query] && !params[:query].empty?
    results = MetaSpotify::Track.search(params[:query])
    results = results[:tracks].select { |t| t.album.is_available_in?('gb') }
    if results.any?
      @tracks = results
      erb :index
    else
      flash[:error] = "Hey hipster, we've never heard of that one."
      redirect '/'
    end
  else
    redirect '/'
  end
end

post '/add' do
  if Redis.current.rpush 'collabify:tracks', params[:uri]
    flash[:notice] = "Sounds good to me, it's in the queue."
  end
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

