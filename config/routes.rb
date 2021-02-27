Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  authenticated :user do
    root to: 'pages#dashboard', as: :authenticated_root
  end
  root to: 'pages#home'
  get 'calendar', to: 'pages#calendar'
  resources :events
  resources :expenses do  
   resources :expense_types
  end
  resources :budgets do  
    resources :expense_types
   end
  resources :places, only: [:index, :show] do
    resources :favourite_places, except: [:edit, :update]
  end
  resources :photos
end