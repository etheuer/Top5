Top5::Application.routes.draw do
  get "tag/show"
  devise_for :users
  resources :lists do
  	member do
  		put "like", to: "lists#upvote"
  	end
  	get :autocomplete_tag_name, :on => :collection    
  end

  resources :tag

  root "lists#index"  

end
