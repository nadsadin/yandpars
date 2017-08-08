Rails.application.routes.draw do


  resources :parce_files
  root 'parce_files#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
