Rails.application.routes.draw do

  devise_for :users
  root 'users#top'
  get '/system' => 'users#system'

  resources :users ,only:[:edit,:updata,:show,:index] do
  	get :lives_index ,on: :member
  	get :joined_group ,on: :member
  end
  

  resources  :mymembers

  resources :lives do
  	resources :joins,only: [:create,:destroy] do
  		collection do 
  			get :waiting
  			get :accepted
  		end	
  	end

  	resources :group_talks,only:[:create,:destroy]
  end

  post '/joins/:id/accept' => 'join#accept', as: :join_accept
  
  
  

  
end
