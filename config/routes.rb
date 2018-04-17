Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:create, :show] do
        member do
          resources :saved_jobs, only: [ :index, :create, :delete ]
        end
      end
    resources :jobs, only: [ :index, :show, :update, :create, :edit, :delete, :new ]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
