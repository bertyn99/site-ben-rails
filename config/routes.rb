Rails.application.routes.draw do
  devise_for :admins
  root to:'static_pages#index'
  get '/about', to:'static_pages#about', as: 'about'
  get '/services', to:'static_pages#services', as: 'services'
  get '/contact', to:'static_pages#contact', as: 'contact'
  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
