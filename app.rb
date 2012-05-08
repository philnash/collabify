require 'erb'

enable :sessions
set :session_secret, 'f2580028413ac5ea0894c1e7a88a7442e4fcf69507144a78d61dc3f76d32da60'
use Rack::Flash

set :env, ENV["RACK_ENV"]

$redis = Redis.new
# $redis = Redis.connect(:url => ENV['REDISTOGO_URL'])

get '/' do
  @title = production? ? "production" : "not production"
  erb :index
end

get '/search.?:format?' do
  begin
    if params[:query] && !params[:query].empty?
      results = MetaSpotify::Track.search(params[:query])
      @tracks = results[:tracks].select { |t| t.album.is_available_in?('gb') }
      if params[:format] == 'js'
        { :status => 200, :view => erb(:tracks, :layout => false) }.to_json
      else
        erb :index
      end
    else
      redirect '/'
    end
  rescue MetaSpotify::RateLimitError => e
    message = "Better slow down, Spotify is limiting us"
    if params[:format] == 'js'
      {:status => 403, :message => message, :type => 'error'}
    else
      flash[:error] = message
      erb :index
    end
  end
end

post '/add.?:format?' do
  if $redis.rpush 'collabify:tracks', params[:uri]
    message = "Sounds good to me, it's in the queue."
    if params[:format] == 'js'
      {:status => 200, :message => message, :type => 'notice'}.to_json
    else
      flash[:notice] = message
      redirect '/'
    end
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

