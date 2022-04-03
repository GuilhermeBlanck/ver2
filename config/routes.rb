Rails.application.routes.draw do
  devise_for :users, only: [:sessions], controllers: {sessions: 'users/sessions'}
  devise_for :partners, only: [:sessions], controllers: {sessions: 'partners/sessions'}
  
  post 'registrations', to: 'registrations#create'
  delete 'registrations', to: 'registrations#destroy'

  namespace :partners_control do
    post 'registrations', to: 'registrations#create'
    delete 'registrations', to: 'registrations#destroy'
  end

end