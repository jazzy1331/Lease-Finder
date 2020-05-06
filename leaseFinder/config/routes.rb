=begin
	
	Edited 4/15/2020 by Juhee Park: added root
  Edited 4/19/2020 by Ern Chi Khoo: added routes 
  Edited 4/15/2020 by Juhee Park: added root
  Edited 4/19/2020 by Lang Xu: modified name routes for login paths
  Edited 4/20/2020 by Ern Chi Khoo: removed routes 

	
=end

Rails.application.routes.draw do
  get 'login_student' => 'sessions#login_student'
  get 'login_landlord' => 'sessions#login_landlord'
  post 'login_student' => 'sessions#create_student_session'
  post 'login_landlord' => 'sessions#create_landlord_session'
  delete 'logout' => 'sessions#destroy'
  
  resources :properties 
  resources :reviews
  resources :sublet_posts
  resources :landlords
  resources :students

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'sublet_posts#index'
end
