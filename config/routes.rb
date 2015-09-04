Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :user, controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }, path: ''#, 
                    #path_names: { sign_in: 'sign_in', sign_out: 'sign_out', sign_up: 'sign_up' }
  
  devise_scope :user do
    get 'new_password' => 'devise/passwords#new'
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
end
