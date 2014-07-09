Kristaks::Application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  root 'homes#show'

  resources :stores, only: [] do
    resource :hours, only: [:edit]
    resources :hours, only: [:update]
  end
end
