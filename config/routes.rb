Rails.application.routes.draw do
  get 'physicals/index'

  devise_for :users

  resources :users, only: [] do
    resources :physicals, only: [:show, :new, :update, :destroy, :edit]
  end
end
