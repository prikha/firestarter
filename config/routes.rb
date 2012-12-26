Firestarter::Application.routes.draw do
  root :to=>"welcome#index"

  resources :jobs, except: :show


end
