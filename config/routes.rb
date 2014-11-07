Top5::Application.routes.draw do
  devise_for :users
  resources :lists

  root "lists#index"  
end
