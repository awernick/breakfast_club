Rails.application.routes.draw do

  # Home page
  root 'static_pages#home'
  
  resources :professors
 
  resources :study_groups do
    post 'join'
    put 'leave'
    resources :users, only: :index
  end
  
  resources :users do
    resources :study_groups, only: :index
  end
  

  resources :universities do
    resources :professors, only: [:index, :show, :create]
    resources :courses, shallow: true
  end

  resources :courses do
    resources :study_groups, shallow: true
  end
end
