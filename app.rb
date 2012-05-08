require 'erb'

enable :sessions
set :session_secret, 'f2580028413ac5ea0894c1e7a88a7442e4fcf69507144a78d61dc3f76d32da60'
use Rack::Flash

set :env, ENV["RACK_ENV"]

$redis = Redis.connect(:url => ENV['REDISTOGO_URL'])

get '/' do
  @title = production? ? "production" : "not production"
  erb :index
end

get '/search.?:format?' do
  if params[:query] && !params[:query].empty?
    results = MetaSpotify::Track.search(params[:query])
    results = results[:tracks].select { |t| t.album.is_available_in?('gb') }
    if results.any?
      @tracks = results
      if params[:format] == 'js'
        {:status => 200, :view => erb(:tracks, :layout => false)}.to_json
      else
        erb :index
      end
    else
      flash[:error] = "Hey hipster, we've never heard of that one."
      redirect '/'
    end
  else
    redirect '/'
  end
end

post '/add.?:format?' do
  if $redis.rpush 'collabify:tracks', params[:uri]
    flash[:notice] = "Sounds good to me, it's in the queue."
  end
  if params[:format] == 'js'
    {:status => 200}.to_json
  else
    redirect '/'
  end
end

post '/clear_queue' do

end

get '/list' do
  length = $redis.llen 'collabify:tracks'
  @tracks = $redis.lrange 'collabify:tracks', 0, length
  content_type :json
  @tracks.to_json
end

