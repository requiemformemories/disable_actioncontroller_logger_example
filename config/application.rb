require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DisableActioncontrollerLoggerExample
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    #

    if ENV["DISABLE_ACTION_CONTROLLER_LOGGER"] == "true"
      # The Rails docs (https://guides.rubyonrails.org/configuring.html#config-action-controller-logger) say
      # you can set the logger to nil to disable it. But in reality, it does not work this way.
      # config.action_controller.logger = nil

      # The logger will be disabled with the follwing code
      # config.action_controller.logger = Logger.new(IO::NULL)
    end
  end
end
