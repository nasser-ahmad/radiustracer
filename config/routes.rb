Rails.application.routes.draw do
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#home'

  resources :requests, :only => [:show , :new, :create , :index]

  resources :isps,  :only => [:show , :new, :create , :index , :edit , :destroy] do
  	resources :ip_ranges , shallow: true do
  		resources :ip_range_notes
  	end
  	resources :isp_hrs , :notes
  end

  resources :users

end
