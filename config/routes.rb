Rails.application.routes.draw do
  devise_for :users
  root 'media_items#index'
  resources :media_items, only: [:index, :new, :create, :show] do
  	get :toggle_share, on: :member
  	get :shared_media, on: :collection
  end
  match 'media_items/search', to: 'media_items#search', via: [:post], as: :search_media
end
