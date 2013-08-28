Ericisaac::Application.routes.draw do

  resources :users


  devise_for :admins,
             :controllers => {
                 :passwords => "passwords",
                 :registrations => "registrations",
                 :sessions => "sessions"
             } do
    get "sign_in", :to => "sessions#new"
    get "sign_out", :to => "sessions#destroy"
    get "sign_up", :to => "registrations#new"
  end
  root :to => "welcome#index"

  match 'admin', :to => 'admin#index'

  namespace :admin do
    resources :channels
  end

end
