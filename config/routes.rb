Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      root 'welcome#index'
      resources :find, only: [:index]
    end
  end
end
