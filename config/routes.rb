Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:create, :show] do
        member do
          put "/", to: "users#save_job"
        end
      put '/saved_jobs', to: "users#un_save"
      end


    resources :questions, only: [:show]
    resources :answers, only: [:create]
    resources :jobs, only: [ :show, :update, :create, :edit, :delete, :new ]
    put '/jobs', to: 'jobs#index'
    put '/questions', to: 'questions#index'
    put '/saved_jobs', to: 'saved_jobs#saved_jobs'


    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
