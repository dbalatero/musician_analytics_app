group :accounts do
  group :last_fm do
    set :api_key, ENV['LASTFM_API_KEY']
    set :artist_name, ENV['LASTFM_ARTIST_NAME']
  end

  group :twitter do
    set :username, ENV['TWITTER_USERNAME']
  end

  group :myspace do
    set :username, ENV['MYSPACE_USERNAME']
  end
end
