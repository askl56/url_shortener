Rails.application.routes.draw do
  resources :links

  get ':slug' => 'links#show'

  root 'home#index'
end
