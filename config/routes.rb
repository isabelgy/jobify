Rails.application.routes.draw do
  root to: 'pages#home'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :jobs, only: [ :index, :show, :update, :create, :edit, :delete, :new ] do
        member do
          resources :saved_jobs, only: [ :index, :create, :delete ]
        end
      end
    resources :users, only: [:create, :show]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
