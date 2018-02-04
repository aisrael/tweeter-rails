# frozen_string_literal: true

# The base ApplicationController
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
