Rails.application.routes.draw do
  resources :posts
  get 'users/dashboard'
  root 'static_pages#home'
  get 'static_pages/about'

  devise_for :users, controllers: {
  registrations: 'users/registrations',
  sessions: 'users/sessions',
  passwords: 'users/passwords',
  confirmations: 'users/confirmations'
 }

  devise_scope :user do
    get 'sign_up', to: 'users/registrations#new'
    get 'sign_in', to: 'users/sessions#new'
    post 'sign_in', to: 'users/sessions#new'
    get 'sign_out', to: 'devise/sessions#destroy'
    delete 'sign_out', to: 'users/sessions#destroy'
    get 'account_settings', to: 'users/registrations#edit', as: 'account_settings'
  end

  get '/thank_you', to: 'static_pages#thank_you', as: 'thank_you'
  get '/dashboard', to: 'users#dashboard', as: 'dashboard'


end
