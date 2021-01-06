# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
    html_tag.html_safe
    class_attr_index = html_tag.index 'class="'

    if class_attr_index
        html_tag.insert class_attr_index + 7, 'is-danger '
    else
        html_tag.insert html_tag.index('>'), ' class="is-danger"'
    end
end

ActionMailer::Base.smtp_settings = {
    :user_name => 'apikey',
    :password => ENV['SENDGRID_API_KEY'],
    :domain => 'odin-flights.herokuapp.com',
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
}
