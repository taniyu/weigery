Rails.application.routes.draw do
  get 'physicals/index'

  devise_for :users

  resources :users, only: [] do
    resources :physicals, only: [:show, :new, :update, :destroy, :edit]
  end

  namespace :admin do
    resources :users do
      post :lock, on: :member
      post :unlock, on: :member
    end
  end

end
