Rails.application.routes.draw do
  root to:'home#top'
  get 'home/about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :users, :except => [:new, :destroy]

end