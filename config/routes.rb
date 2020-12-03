Rails.application.routes.draw do
  root "pages#home"
  resources :users, only: [:create] do
    collection do
      get :register
      get :login
      post :sign_in
      get :edit
      patch :update
    end
  end
end
