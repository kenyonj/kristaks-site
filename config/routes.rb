Kristaks::Application.routes.draw do
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
