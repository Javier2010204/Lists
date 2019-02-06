Rails.application.routes.draw do

  resources :lists do 
    resources :assignments
  end

  devise_for :users

  put "/lists/:list_id/assignmets/:id/complete", to: "assignments#complete"


  authenticated :user do
  	root 'home#index'
  end

  unauthenticated :user do
  	devise_scope :user do
  		root 'home#unregistered', as: :unregistered_root
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
