Firestarter::Application.routes.draw do
  root :to=>"welcome#index"
  resources :projects do
    resources :jobs, except: :show
  end
end
