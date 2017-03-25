Rails.application.routes.draw do

  devise_for :users
  root 'users#top'
  get '/system' => 'users#system'

  resources :users ,only:[:show, :edit,:update,:index] do
  	get :lives_index ,on: :member
  	get :joined_group ,on: :member
  end
  
  # get '/users/:id' => 'users#show'

  resources  :mymembers

  resources :lives do
  	resource :joins,only: [:create,:destroy] do
  		collection do 
  			get :waiting
  			get :accepted
  		end	
  	end

  	resources :group_talks,only:[:create,:destroy]
  end

  patch '/joins/:id/accept' => 'joins#accept', as: :join_accept
  
  
  

  
end
