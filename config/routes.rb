Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :user, controllers: { sessions: 'custom_sessions', omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }, path: ''

  devise_scope :user do
    get 'new_password' => 'devise/passwords#new'
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
end
