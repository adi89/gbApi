require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GoBungaapi
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.autoload_paths += %W["#{config.root}/app/models/validators/"]
    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.action_mailer.smtp_settings = {
      address: ENV.fetch("SMTP_ADDRESS"),
      authentication: :plain,
      domain: ENV.fetch("SMTP_DOMAIN"),
      enable_starttls_auto: true,
      password: ENV.fetch("SMTP_PASSWORD"),
      port: "587",
      user_name: ENV.fetch("SMTP_USERNAME")
    }

    config.action_mailer.default_url_options = { host: ENV["SMTP_DOMAIN"] }
  end
end
