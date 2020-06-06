Rails.application.routes.draw do
  get 'phrases/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "searches#top"
  get "/links" => "searches#exlink", as: "exlink"
  resources :searches, only:[:index]
  resources :phrases, only: [:index]

end
