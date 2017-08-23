Rails.application.routes.draw do
  devise_for :users,
    class_name: "Woodlock::User",
    controllers: { omniauth_callbacks: "woodlock/users/omniauth_callbacks" },
    path: ""
end
