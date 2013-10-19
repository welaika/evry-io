Evry::Application.routes.draw do
  root 'static#welcome'

  devise_for :users
end
