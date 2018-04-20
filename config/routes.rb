Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:create, :show] do
        member do
          # get "/", to: "users#save_job"
          post "/", to: "users#my_jobs"
        end
      get '/saved_jobs', to: "users#un_save"
      end


    resources :questions, only: [:show]
    resources :answers, only: [:create]
    resources :jobs, only: [ :show, :update, :create, :edit, :destroy, :new ]
    resources :saved_jobs, only: [:create]
    get '/jobs', to: 'jobs#index'
    get '/questions', to: 'questions#index'
    get '/saved_jobs', to: 'saved_jobs#saved_jobs'


    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
