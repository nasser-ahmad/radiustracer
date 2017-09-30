Rails.application.routes.draw do
  

  root 'pages#home'

  resources :requests, :only => [:show , :new, :create , :index]

  resources :isps,  :only => [:show , :new, :create , :index , :edit , :destroy] do
  	resources :ip_ranges , shallow: true do
  		resources :ip_range_notes
  	end
  	resources :isp_hrs , :notes , :isp_adsl_accounts
  end

  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/search', to: 'ip_searches#create'

  get '/req_search' , to:'requests#search'

  get '/action_logs', to: 'action_logs#index'
end
