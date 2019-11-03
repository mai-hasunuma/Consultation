# frozen_string_literal: true

Rails.application.routes.draw do
  get 'notifications/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # home
  root 'home#top'

  # end_user
  resources :users, only: %i[index edit update destroy show]
  get 'search', to: 'users#search'

  # board
  resources :boards, only: %i[new create edit update index show destroy]
  get 'search', to: 'boards#search'

  # board_comment
  resources :board_comments, only: %i[create destroy]

  # room
  resources :rooms, only: %i[create show index]

  # room_comment
  resources :room_comments, only: %i[create destroy]

  # notification
  resources :notifications, only: :index

  # actioncable
  mount ActionCable.server => '/cable'
end
