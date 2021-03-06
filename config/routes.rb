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
  match '/site/tags/:id', :to => "tags#show", :as => :tag
  resources :bio, :only => :index, :as => :bio
  resources :tags, :only => :show

  namespace :admin do
    resources :channels do
      resources :photos do
        collection do
          post :sort
        end
        member do
          put :remove_content
        end
      end
      resources :tags do
        collection do
          post :sort
        end
        member do
          put :remove_content
        end
      end
    end
    resources :photos
    resources :bios
    resources :contacts
    resources :tags
  end
  match '/site/bio', :to => "bio#index"
  match '/site/:id', :to => "channels#show", :as => :channel
  match '/site/:channel_id/:id', :to => "channels/photos#show", :as => :channel_photo
end
