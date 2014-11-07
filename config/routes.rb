Top5::Application.routes.draw do
  devise_for :users
  resources :lists do
  	member do
  		put "like", to: "lists#upvote"
  	end
  end

  root "lists#index"  
end
