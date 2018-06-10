Rails.application.routes.draw do
 

#get 'welcome/info', to: 'welcome#info' #to welcome controller, home action
get 'welcome/info', to: 'users#new' 

resources :users, except: [:new]


get 'welcome/map', to: 'welcome#map'
 
 
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
