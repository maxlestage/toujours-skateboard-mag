Rails.application.routes.draw do

  root to: 'public#index'

  get  '/album' => 'public#album', :as => :album
  get '/hello' => 'hello#index', :as => :hello_world
  get '/goodbye' => 'goodbye#index', :as => :good_bye
  get '/time' => 'time#index', :as => :time

  get 'form/index' => 'form#index', :as => :form
  resources :form, only: [:index, :new, :create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
