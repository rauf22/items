Rails.application.routes.draw do
 # get 'welcome/index'

 # devise_for :admins
  #get 'persons/profile', as: 'user_root'

#root 'items#index'
root 'welcome#index'
  


	#devise_score :user do
		#get "/users/sing_out" => "devise/sessions#destroy"
	#end

	#devise_for :users

resources :items do
  get :upvote, on: :member
  get :expensive, on: :collection
 end 

 	#match "admin/users_count" => "admin#users_count"

end
