require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
# require "sprockets/railtie"
# require "action_cable/engine"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Woodmister
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    I18n.available_locales = [ :ru ]
    I18n.default_locale = :ru

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'https://www.liqpay.ua', 'https://woodmister-uploads.s3.eu-west-3.amazonaws.com/'
        resource '*', headers: :any, methods: [:get, :post, :options]
      end
    end

  end
end
