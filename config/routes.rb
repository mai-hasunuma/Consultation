Rails.application.routes.draw do
  get 'notifications/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'rooms/show'
  get 'rooms/index'
  get 'boards/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # home
  root 'home#top'

  #end_user
  resources :users, only: [:index, :show, :edit, :update]
  get 'search', to: 'users#search'

  # board
  resources :boards, only: [:new, :create, :edit, :update, :index, :show]
  get 'search', to: 'boards#search'

  # room
  resources :rooms, only: [:create, :show, :index]

  # room_comment
  resources :room_comments, only: :create

  # notification
  resources :notifications, only: :index

  #actioncable
  mount ActionCable.server => '/cable'
end
