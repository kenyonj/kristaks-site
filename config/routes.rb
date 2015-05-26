Kristaks::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  ActiveAdmin.routes(self)
  resource :session, only: [:new, :create, :destroy]
  root 'homes#show'

  resources :stores, only: [] do
    resource :hours, only: [:edit]
    resources :hours, only: [:update]
    resources :flavors, only: [:new, :create, :index]
  end

  resources :flavors, only: [:edit, :destroy, :update] do
    resource :stock, only: [:update]
  end
end
