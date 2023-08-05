Rails.application.routes.draw do

  root 'tests#index'

  devise_for :users, path_names: { sign_in: :login, sign_out: :logout }, controllers: {
    sessions: 'users/sessions'
  }

  resources :tests, only: :index do
    member { post :start }
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  resources :gists, only: :create

  resources :feedback, only: %i[new create]

  namespace :admin do
    resources :gists, only: :index
    resources :badges

    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: %i[index] do
        resources :answers, shallow: true, except: %i[index]
      end
    end
  end
end
