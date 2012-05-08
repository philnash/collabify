require 'erb'

enable :sessions
set :session_secret, 'f2580028413ac5ea0894c1e7a88a7442e4fcf69507144a78d61dc3f76d32da60'
use Rack::Flash

set :env, ENV["RACK_ENV"]

configure :development do
  $redis = Redis.new
end
configure :production do
  $redis = Redis.connect(:url => ENV['REDISTOGO_URL'])
end

get '/' do
  @title = production? ? "production" : "not production"
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

