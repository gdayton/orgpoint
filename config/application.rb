require File.expand_path('../boot', __FILE__)

require 'rails/all'

require 'csv'

#require 'iconv'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Directory
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Pacific Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
    config.serve_static_files = true
    
    config.assets.paths << Rails.root.join("vendor", "assets", "bower_components")
    
    config.paperclip_defaults = {
        :storage => :s3,
        :s3_host_name => 's3-us-west-1.amazonaws.com',
        :s3_credentials => {
			:bucket => "orgpoint",
			:access_key_id => "AKIAJXFJLRPQ3ASZSJIQ",
			:secret_access_key => "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"
  		}
 	}
  end
end
