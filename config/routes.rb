Kristaks::Application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  root 'homes#show'
end
