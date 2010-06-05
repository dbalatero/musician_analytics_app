# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_musician_analytics_app_session',
  :secret      => 'f2ea6aa02ffe393585478e8f7e1129e0fc3cc27e57aadd5a32ce02d48418820053f6d3acf87798052bebc52bcd4ea90e80fbee9e9f07e3360d28333376ffc678'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
