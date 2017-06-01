# frozen_string_literal: true

Rails.application.routes.draw do
  # GCP/Kubernetes service health check path
  get '/healthz', to: proc { [200, {}, ['']] }

  resources :tweets

  root to: 'tweets#index'
end
