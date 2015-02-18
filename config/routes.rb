Rails.application.routes.draw do
  devise_for :users
  root 'media_items#index'
  resources :media_items, only: [:index, :new, :create, :show] do
  	get :toggle_share, on: :member
  end
end
