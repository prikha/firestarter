Firestarter::Application.routes.draw do


  root :to=>"projects#index"
  devise_for :users
  resources :projects do
    resources :jobs, except: :show
  end
end
