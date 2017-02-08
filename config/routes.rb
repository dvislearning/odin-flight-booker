Rails.application.routes.draw do

  get 'bookings/new'

  get 'bookings/show'

  root 'flights#index'

  resources :bookings, only: [:create, :index]

  resources :bookings do
  	get 'passengers', on: :member
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
