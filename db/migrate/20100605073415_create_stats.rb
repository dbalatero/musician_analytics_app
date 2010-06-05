class CreateStats < ActiveRecord::Migration
  def self.up
    create_table :stats do |t|
      t.integer :lastfm_playcount
      t.integer :lastfm_listeners
      t.integer :twitter_followers
      t.integer :twitter_friends
      t.integer :myspace_profile_views
      t.timestamps
    end
  end

  def self.down
    drop_table :stats
  end
end
