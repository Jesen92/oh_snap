require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module OhSnap
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.to_prepare do
      Devise::SessionsController.layout "sign_in"
      Devise::RegistrationsController.layout "sign_in"
    end

    ActiveModelSerializers.config.adapter = :json_api

    JsonApiResponders.configure do |config|
      config.required_options = {
          index: [:each_serializer],
          create: [:serializer]
      }
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
