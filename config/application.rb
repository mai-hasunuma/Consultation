# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Consultation
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.i18n.default_locale = :ja
    config.i18n.locale = :ja
    config.time_zone = 'Tokyo'
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

    config.generators do |g|
      g.test_framework :rspec,
                       fixtures: false,
                       # ビュースペックを作成しないことを指定
                       view_specs: false,
                       # ヘルパーファイル用のスペックを作成しない
                       helper_specs: false,
                       # config/routes.rb 用のスペックファイルの作成を省略
                       routing_specs: false
    end
  end
end
