require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Hello
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Log to STDOUT because Docker expects all processes to log here. You could
    # then collect logs using journald, syslog or forward them somewhere else.
    logger           = ActiveSupport::Logger.new(STDOUT)
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
    config.log_tags  = %i[subdomain uuid]

    # Set Redis as the back-end for the cache.
    config.cache_store = :redis_cache_store, {
      url: ENV["REDIS_URL"],
      namespace: "cache"
    }

    # Set Sidekiq as the back-end for Active Job.
    config.active_job.queue_adapter = :sidekiq

  end
end