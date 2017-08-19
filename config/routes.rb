Rails.application.routes.draw do
  resources :accounts
  # Receive an SMS from Twilio with the phone number
  post 'accounts/activate'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
