# frozen_string_literal: true

# app/channels/tweets_channel.rb
class TweetsChannel < ApplicationCable::Channel

  def subscribed
    Rails.logger.debug 'TweetsChannel#subscribed'
    # TODO per user?
    stream_from 'tweets'
  end
end
