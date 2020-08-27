Rails.application.routes.draw do
  resources :emails do
    member do
      patch :read
    end
  end

  root "emails#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
