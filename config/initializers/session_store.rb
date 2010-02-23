# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_2_do_exercise_session',
  :secret      => 'ba4ad16c0defd16ddfee8f6e344c2ee773b21376ddc75d2fa2cdeb81aa1b56730c13d3c30e8386e4f73387b6d6b3a68ebf03cc82c28a4c6155f7fe3d460a52d5'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
