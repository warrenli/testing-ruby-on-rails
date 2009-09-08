# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_contact_form_session',
  :secret      => '7b2100a224a946bd5a9489db07adf22f15d14c0236d3218169a99e6305b4730c24d50856f7132f021ead7856fa85828912b9242bb6e74fd9478dbbb435421892'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
ActionController::Base.session_store = :active_record_store
