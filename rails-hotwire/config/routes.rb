# frozen_string_literal: true

Rails.application.routes.draw do
  mount MissionControl::Jobs::Engine, at: '/jobs'

  resources :todos, only: %i[index new create update edit] do
    member do
      patch :toggle_completed
    end
  end

  resources :comments, only: %i[index create destroy]

  get :up, to: 'rails/health#show'

  root to: 'todos#index'
end
