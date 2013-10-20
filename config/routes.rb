Evry::Application.routes.draw do
  root to: "static#welcome"

  get '/static/welcome' => 'static#welcome'
  get '/static/logged' => 'static#logged'
  get '/static/new' => 'static#new'
  get '/static/list' => 'static#list'
  get '/static/edit' => 'static#edit'

  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }

  resources :tasks, except: :edit do
    collection do
      get :mail_report
    end
    member do
      get :duplicate, :mail_notification
    end
  end
end

