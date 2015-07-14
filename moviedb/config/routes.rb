Rails.application.routes.draw do
  root 'movies#index'
  
  get 'welcome' => 'welcome#index'
  
  resources :movies do
    resources :roles
  end
  
  resources :actors do
    resources :roles
  end
end
