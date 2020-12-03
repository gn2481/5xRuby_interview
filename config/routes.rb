Rails.application.routes.draw do
  resources :users, only: [:create] do
    collection do
      get :register
      get :login
      get :edit
    end
  end
end
