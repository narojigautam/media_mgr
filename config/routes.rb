Rails.application.routes.draw do
  devise_for :users
  root 'media_items#index'
  match 'media_items/search', to: 'media_items#search', via: [:get], as: :search_media
  resources :media_items, only: [:index, :new, :create, :show] do
  	get :toggle_share, on: :member
  	get :shared_media, on: :collection
  end
end
