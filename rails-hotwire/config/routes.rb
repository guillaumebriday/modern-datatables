# frozen_string_literal: true

Rails.application.routes.draw do
  resources :todos, only: %i[index new create update edit]

  root to: 'todos#index'
end
