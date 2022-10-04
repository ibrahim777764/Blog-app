Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
 # root to: "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
    resources :posts, only: [:new, :create]
    resources :comments, only: [:new, :create]
    resources :likes, only: [:create]
  end

end
