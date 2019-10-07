Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # home
  root 'home#top'

  #end_user
  resources :users, only: [:index, :show, :edit, :update]
  get 'search', to: 'users#search'
end
