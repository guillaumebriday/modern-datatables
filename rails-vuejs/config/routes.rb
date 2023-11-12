# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :todos, only: %i[index create show update]
    end
  end

  get :up, to: 'rails/health#show'

  root to: 'application#index'

  get '*path', to: 'application#index', format: false
end
