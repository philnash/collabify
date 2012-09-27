require 'erb'

enable :sessions
set :session_secret, 'f2580028413ac5ea0894c1e7a88a7442e4fcf69507144a78d61dc3f76d32da60'
use Rack::Flash

set :env, ENV["RACK_ENV"]
REDIRECT_URL = "http://www.youtube.com/watch?v=dQw4w9WgXcQ"

# $redis = Redis.new
$redis = Redis.connect(:url => ENV['REDISTOGO_URL'])

get '/' do
  @tracks = track_list
  erb :list
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
  if params['track'].match(/^never gonna give you up/i)
    if params[:format] == 'js'
      {:status => 302, :redirect => REDIRECT_URL}.to_json
    else
      redirect REDIRECT_URL
    end
  else
    track = params.select { |k,v| ['uri', 'track', 'artist'].include?(k) }.to_json
    if $redis.rpush 'collabify:tracks', track
      message = "Sounds good to me, it's in the queue."
      if params[:format] == 'js'
        {:status => 200, :message => message, :type => 'notice'}.to_json
      else
        flash[:notice] = message
        redirect '/'
      end
    else
      message = "Something went wrong, please try again"
      if params[:format] == 'js'
        {:status => 500, :message => message, :type => 'error'}.to_json
      else
        flash[:error] = message
        redirect '/'
      end
    end
  end
end

post '/clear_queue' do

end

get '/list.?:format?' do
  @tracks = track_list
  if params[:format] == 'js'
    content_type :json
    @tracks.to_json
  else
    erb :list
  end
end

helpers do
  def track_list
    length = $redis.llen 'collabify:tracks'
    tracks = $redis.lrange 'collabify:tracks', 0, length
    tracks.map! { |t| JSON.parse(t) }
    tracks
  end
end
