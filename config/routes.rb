Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :movies, only: [:index]
  resources :trailers, only: [:index] do
    collection do
      get :sample
    end
  end
end
