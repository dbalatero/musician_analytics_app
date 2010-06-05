desc "Crontab for gathering stats."
task :cron => :environment do
  accounts = $simple_config.accounts
  hydra = Typhoeus::Hydra.new
  last_fm = MusicianAnalytics::Lastfm.new(hydra)
  twitter = MusicianAnalytics::Twitter.new(hydra)
  myspace = MusicianAnalytics::Myspace.new(hydra)

  stat = Stat.new

  # Get last.fm stats.
  last_fm.get_stats(accounts.last_fm.artist_name) do |stats, error|
    if error
      puts "Got an error from Last.fm: #{error.inspect}"
    else
      stat.lastfm_playcount = stats['playcount']
      stat.lastfm_listeners = stats['listeners']
    end
  end

  twitter.get_stats(accounts.twitter.username) do |stats, error|
    if error
      puts "Got an error from Twitter: #{error.inspect}"
    else
      stat.twitter_followers = stats['followers_count']
      stat.twitter_friends = stats['friends_count']
    end
  end

  myspace.get_stats(accounts.myspace.username) do |stats, error|
    if error
      puts "Got an error from Myspace: #{error.inspect}"
    else
      stat.myspace_profile_views = stats['profile_views']
    end
  end

  puts "Running Hydra!"
  hydra.run

  puts "Got stats, saving!"
  stat.save!
end
