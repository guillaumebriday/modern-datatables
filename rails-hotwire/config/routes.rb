# frozen_string_literal: true

Rails.application.routes.draw do
  resources :todos, only: %i[index new create update edit] do
    member do
      patch :toggle_completed
    end
  end

  root to: 'todos#index'
end
