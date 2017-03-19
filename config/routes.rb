Rails.application.routes.draw do

  devise_for :users
  resources :lives
  resources :mymembers
  root 'user#top'
  resources :user ,only:[:edit,:updata,:show,:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
