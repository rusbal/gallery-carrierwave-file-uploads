Rails.application.routes.draw do

  root 'galleries#index'

  resources :galleries do
    member do
      put 'set_default', as: 'default_painting_on'
    end
    resources :paintings
  end

end
