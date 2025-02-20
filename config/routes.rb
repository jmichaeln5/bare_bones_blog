Rails.application.routes.draw do
  root 'static_pages#home'
  get 'about', to: 'static_pages#about', as: 'about'

  devise_for :users, skip: :all

  devise_for :users, skip: %i[sessions registrations], controllers: {
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'
  }

  devise_scope :user do
    get 'sign_up',          to: 'users/registrations#new'
    get 'sign_up',          to: 'users/registrations#new', as: 'new_user_registration'
    post 'sign_up',         to: 'users/registrations#create',  as: 'user_registration'
    get 'account_settings', to: 'users/registrations#edit', as: 'account_settings'

    get 'sign_in',          to: 'users/sessions#new'
    get 'sign_in',          to: 'users/sessions#new', as: 'new_user_session'
    post 'sign_in',         to: 'users/sessions#create'
    post 'sign_in',         to: 'users/sessions#create', as: 'user_session'
    get 'sign_out',         to: 'devise/sessions#destroy'
    delete 'sign_out',      to: 'users/sessions#destroy'
  end

  get 'thank_you', to: 'static_pages#thank_you', as: 'thank_you'

  get 'dashboard', to: 'users#dashboard', as: 'dashboard'

  resources :posts
  resources :users
end
