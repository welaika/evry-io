Evry::Application.routes.draw do
  authenticated :user do
    root :to => "tasks#index"
  end
  unauthenticated :user do
    devise_scope :user do
      get "/" => "static#welcome"
    end
  end

  get '/static/welcome' => 'static#welcome'
  get '/static/logged' => 'static#logged'
  get '/static/new' => 'static#new'
  get '/static/list' => 'static#list'
  get '/static/edit' => 'static#edit'


  devise_for :users

  resources :tasks
end

