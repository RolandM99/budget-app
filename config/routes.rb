Rails.application.routes.draw do
  # get 'users/index'
  devise_for :users
  unauthenticated :user do
    root to: 'users#index'
  end

  authenticated :user do
    root to: 'categories#index', as: :authenticated_root
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :categories do
    resources :transactions
  end

  devise_scope :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
