require 'action_cable/subscription_adapter/redis'

ActionCable::SubscriptionAdapter::Redis.redis_connector = lambda do |config|
  redis_opts = { url: config[:url] }
  redis_opts[:sentinels] = config[:sentinels] if config.key?(:sentinels)
  ::Redis.new(redis_opts)
end
