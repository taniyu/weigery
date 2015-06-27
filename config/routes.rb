Rails.application.routes.draw do
  get 'physicals/index'

  devise_for :users

  resources :users, only: [] do
    resources :physicals, only: [:create, :new, :destroy, :edit, :update]
  end

  namespace :admin do
    resources :users do
      post :lock, on: :member
      post :unlock, on: :member
    end
  end

end
