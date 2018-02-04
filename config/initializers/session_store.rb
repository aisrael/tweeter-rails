# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Rails.application.config.session_store :cookie_store, key: '_Tweeter_session'
Rails.application.config.session_store :redis_store,
                                       servers: ["redis://:secretpassword@#{ENV['REDIS_HOST_NAME']}:6379/0/session"],
                                       expire_after: 60.minutes
