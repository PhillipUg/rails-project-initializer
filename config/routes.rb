Rails.application.routes.draw do
  mount ActiveAnalytics::Engine, at: "analytics"  # http://localhost:3000/analytics

  resources :projects, only: [:new, :create]
  root 'projects#new'
end
