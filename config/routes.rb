Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "shops/search" => "shops#search"

  get "shops/tagsearch" => "shops#tagsearch"

  get "shops/mapsearch" => "shops#mapsearch"

  get "shops/condition" => "shops#condisearch"

  get "shops/random" => "shops#randomsearch"

  get "shops/index2" => "shops#index2"

  get "shops/index3" => "shops#index3"

  get "shops/index4" => "shops#index4"

  get "shops/about" => "shops#about"

  get "top2" => "shops#top2"

  get "top" => "shops#top"

  resources :shops do
    resources :likes, only: [:create, :destroy]
  end

  resources :genres

  resources :infos

  resources :prices

  resources :users

  root 'shops#top'
end
