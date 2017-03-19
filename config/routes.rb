Rails.application.routes.draw do

  root 'user#top'
  resources :user ,only:[:edit,:updata,:show,:index]
  devise_for :users

  resources  :mymembers

  resources :lives do
  	resources :join,only: [:create,:destroy] do
  		member do 
  			get :waiting
  			get :accepted
  		end	
  	end
  end

  post '/joins/:id/accept' => 'join#accept', as: :join_accept
  
  

  
end
