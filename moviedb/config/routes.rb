Rails.application.routes.draw do
  get 'welcome' => 'welcome#index'
  
  resources :movies
end
