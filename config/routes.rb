Rails.application.routes.draw do
  resource :home, controller: :home, only: [:show, :create]
  root to: redirect('/home')
end
