Rails.application.routes.draw do
  root 'movies#index'
  
  get 'welcome' => 'welcome#index'
  
  resources :movies
end
