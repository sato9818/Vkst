Rails.application.routes.draw do
  get 'phrases/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "searches#top"
  resources :searches, only:[:index]
  resources :phrases, only: [:index]
  resources :exlinks, only: [:index]
  get "searches/post" => "posts#search", as: "posts_search"

end
