Rails.application.routes.draw do
  get '/table', to: 'websites#table'
  resources :websites, :path => '/'
end
