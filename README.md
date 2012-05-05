# Collabify #

... you'll see

## Running the server ##

First, bundle the server gems:

    cd server
    bundle install --binstubs --path vendor/bundle

We require you use Pow as your webserver due to hard-coded links in the client app. From the server directory:

    powder install # if Pow is not already installed
    powder link
    powder open # opens http://server.dev in the browser

## Running the client ##

First, copy the `client` directory to `~/Spotify/collabify`

    mkdir ~/Spotify
    cp -r client ~/Spotify/collabify

Then open the app in Spotify. To do this, search for `spotify:app:colabify`

## TODO ##

* Write a bootstrap script for all of the above
* Prevent duplicate playlists being made
* Sort out polling the server from the client
* Figure out if we are making the best use of Redis
