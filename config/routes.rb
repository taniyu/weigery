Rails.application.routes.draw do

  devise_for :users

  root to: 'dashboards#index'

  resources :users, only: [] do
    resources :physicals, only: [:create, :new, :destroy, :edit, :update, :index]
  end

  namespace :admin do
    resources :users do
      post :lock, on: :member
      post :unlock, on: :member
    end
  end

end
