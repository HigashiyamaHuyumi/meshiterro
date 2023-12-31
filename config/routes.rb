Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: "homes#top"
  get '/homes/about' ,to: 'homes#about', as: 'about'  
  resources :post_images, only: [:new, :create,:index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]  #resourceと単数形にすると、/:idがURLに含まれなる
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
end