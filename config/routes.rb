Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 	root 'sessions#new'

 	get     '/home',   to: 'static_pages#home'
  get	 		'/login',  to: 'sessions#new'
  post 		'/login',	 to: 'sessions#create'
  delete  '/logout', to: 'sessions#destroy'
end
