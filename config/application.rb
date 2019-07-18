require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
require_relative 'env_variables'

module GeminiStartBackend
  class Application < Rails::Application
    config.secret_key_base = ENV['SECRET_KEY_BASE']
    config.autoload_paths += %W(#{config.root}/lib)
  end
end
