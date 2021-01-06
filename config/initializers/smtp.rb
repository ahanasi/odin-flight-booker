#if you are using the API key
ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey',
  :password => ENV['SENDGRID_API_KEY'],
  :domain => 'odin-flights.herokuapp.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}