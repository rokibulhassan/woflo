Woflo::Application.routes.draw do

  devise_for :users

  resources :users do
    collection do
      get :registration
      get :login
    end
  end

  resources :teams

  resources :admins do
    collection do
      get :dashboard
    end
  end

  resources :companies do
    member do
      get :design
    end
  end

  resources :projects do
    collection do
      get :dashboard
    end
  end

  resources :activity_requests
  resources :parent_activities do
    member do
      get :update_status
    end
  end
  resources :activities do
    member do
      get :fetch_activities
    end
  end

  resources :topics

  root :to => 'users#registration'
end
