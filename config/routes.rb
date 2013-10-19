Evry::Application.routes.draw do
  root 'static#welcome'

  get '/static/welcome' => 'static#welcome'
  get '/static/logged' => 'static#logged'
  get '/static/new' => 'static#new'
  get '/static/list' => 'static#list'
  get '/static/edit' => 'static#edit'


  devise_for :users

  resources :tasks
end
