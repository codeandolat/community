Rails.application.routes.draw do
  devise_for :users

  unauthenticated :user do
    devise_scope :user do
      root to: 'unauthenticated#index', as: :unauthenticated_root
    end
  end

  authenticated :user do
    root to: 'posts#index', as: :authenticated_root
  end

  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
