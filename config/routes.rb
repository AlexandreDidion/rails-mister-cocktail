Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'cocktails#index'
  resources :cocktails, only: %i[index show new create edit update] do
    resources :doses, only: %i[new create]
    resources :reviews, only: %i[new create]
    collection do
      get :search
    end
  end
  resources :doses, only: :destroy
  resources :reviews, only: :destroy
end
