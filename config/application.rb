require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Weigery
  class Application < Rails::Application
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    config.preferred_syntax = :sass
    config.sass.syntax = :sass

    config.i18n.default_locale = :ja

    config.generators.template_engine = :slim
    config.generators.helper          = false
    config.generators.assets          = false

    config.git_revision = `git log --abbrev-commit --pretty=oneline | head -1 | cut -d' ' -f1`
    config.autoload_paths += %W(#{config.root}/lib)
    config.generators.test_framework = 'rspec'
    config.active_record.raise_in_transactional_callbacks = true
  end
end
