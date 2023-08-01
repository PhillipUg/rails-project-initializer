Rails.application.routes.draw do
  resources :projects, only: [:new, :create]
  root 'projects#new'
end
