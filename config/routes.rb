Rails.application.routes.draw do
  get 'physicals/index'

  devise_for :users

  namespace :admin do
    resources :users do
      post :lock, on: :member
      post :unlock, on: :member
    end
  end
end
