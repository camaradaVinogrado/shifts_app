Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    resources :shifts, defaults: { format: 'json' }, except: %i[edit new update] do
      collection do
        delete '/' => :destroy_multiple
      end
    end
  end
end
