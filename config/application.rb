require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ChatSpace
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
      config.i18n.default_locale = :ja
  # jaファイルを読み込むための記述
  end
end

# 使用しないファイルを作成しないようにする
module PairsLike
  class Application < Rails::Application
    config.generators do |g|
      g.helper false
      g.test_framework false
      g.fixtures false
    end
  end
end
