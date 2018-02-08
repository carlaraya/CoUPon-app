Rails.application.routes.draw do
  get 'manage', to: 'manage#index'

  devise_for :orgs
  root to: 'home#index'
end
