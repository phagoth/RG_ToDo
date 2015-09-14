Rails.application.routes.draw do
  devise_for :users
  resources :projects do
    resources :tasks do
      member do
        patch :complete
      end
    end
  end

  authenticated :user do
    root to: 'projects#index', as: :authenticated_root
  end

  root to: redirect('/users/sign_in')
  
end
