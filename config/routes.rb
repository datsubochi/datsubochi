Rails.application.routes.draw do
  devise_for :users
  resources :lives do
  	resources :join,only: [:create,:destroy] do
  		member do 
  			get :waiting
  			get :accepted
  		end	
  	end
  end
  post '/joins/:id/accepted' => 'join#accept', as: :join_accept
  resources  :mymembers
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
