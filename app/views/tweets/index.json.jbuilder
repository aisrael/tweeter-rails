# frozen_string_literal: true

json.array! @tweets, partial: 'tweets/tweet', as: :tweet
