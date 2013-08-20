Ericisaac::Application.routes.draw do

  devise_for :admins

  root :to => "welcome#index"

  match 'admin', :to => 'admin#index'

  namespace :admin do

  end
end
