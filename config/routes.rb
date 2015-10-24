Rails.application.routes.draw do

  # Home page
  root 'static_pages#home'
 
  # users
  resources :study_groups do
    post 'join'
    put 'leave'
    resources :users, only: :index
  end
  
  resources :users do
    resources :study_groups, only: :index
  end

  resources :universities do
    resources :courses, shallow: true
  end

  resources :courses, except: [:index, :new, :create] do
    resources :professors
    resources :study_groups, shallow: true
  end
end
