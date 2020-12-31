Rails.application.routes.draw do
  # devise_for :usersを削除する事でdb:migrate、rails g deviseを行えた。
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "prototypes#index"
end
