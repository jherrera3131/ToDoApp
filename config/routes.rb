Rails.application.routes.draw do
  
  resources :microposts
  
  root "home#index"
  get '/' => 'home#index', as: :home_page
  get 'home/index' => 'home#index'
  get 'home' => 'home#index'

  get 'home/contact' => 'home#contact', as: :contact_page

  resources :users do
    member do
      get :boost
    end
  end

  get "/signup", to: "users#new", as: :signup
  get "/login", to: "sessions#new", as: :login
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: :logout


  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  

end
