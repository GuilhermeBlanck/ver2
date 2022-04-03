Rails.application.routes.draw do
  get 'that/it'
  root 'this#that'
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # scope :v1 do
  #   devise_scope :user do
  #     post "sign_up", to: "registrations#create"
  #     post "sign_in", to: "sessions#create"
  #   end
  # end
  # delete 'users/sign_out', to: 'users#destroy'
  get 'this', to: 'that#it'
  devise_for :users, only: [:sessions], controllers: {sessions: 'users/sessions'}
  
  post 'registrations', to: 'registrations#create'
  delete 'registrations', to: 'registrations#destroy'

end
