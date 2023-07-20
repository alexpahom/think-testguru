Rails.application.routes.draw do

  root 'tests#index'

  devise_for :users, path_names: { sign_in: :login, sign_out: :logout }, controllers: {
    registrations: 'users/registrations'
  }

  resources :tests do
    resources :questions, shallow: true, except: %i[index] do
      resources :answers, shallow: true, except: %i[index]
    end

    member { post :start }
  end

  resources :test_passages, only: %i[show update] do
    member { get :result }
  end
end
