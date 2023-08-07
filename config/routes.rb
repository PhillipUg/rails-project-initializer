Rails.application.routes.draw do
  resources :projects, only: [:new, :create] do
    get :download_count, on: :collection
  end

  root 'projects#new'
end
