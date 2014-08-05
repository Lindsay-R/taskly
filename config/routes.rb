Rails.application.routes.draw do
  root "task_lists#index"
  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create"
  get "signout" => "sessions#destroy", as: :signout

  get "about" => "about#about"  #controler/method(aka. action)

  get "new" => "task_lists#new", as: :new
  post "new" => "task_lists#create"

  get '/:id/edit', to: 'task_lists#edit'
  patch '/:id', to: 'task_lists#update'
  delete '/:id', to: 'task_lists#destroy'
end
