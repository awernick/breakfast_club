Rails.application.routes.draw do

  # Home page
  root 'static_pages#home'
  
  # users
  resource :study_groups do
    post 'join'
    put 'leave'
    resource :users, only: :index
  end
  
  resource :users do
    resource :study_groups, only: :index
  end

  resource :universities do
    resource :courses, shallow: true
  end

  resource :courses, except: [:index, :new, :create] do
    resource :professors
    resource :study_groups, shallow: true
  end
end
