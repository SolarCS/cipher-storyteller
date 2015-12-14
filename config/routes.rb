Rails.application.routes.draw do

  namespace :api do
    resources :sessions, only: [:create] do
      delete :destroy, on: :collection
      get :verify, on: :collection
    end
    resources :stories
    resources :story_types, only: [:index]
    resources :votes, only: [:create, :destroy]
  end

  root controller: :application, action: :index
  get '/*path', controller: :application, action: :index

end
