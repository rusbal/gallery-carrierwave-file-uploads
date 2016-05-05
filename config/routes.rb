Rails.application.routes.draw do

  get 'paintings/new'

  get 'paintings/create'

  root 'galleries#index'

  resources :galleries do
    resources :paintings
  end

end
