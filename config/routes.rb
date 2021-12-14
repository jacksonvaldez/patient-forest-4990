Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/studios', to: 'studios#index'
  get '/movies', to: 'movies#index'
  get '/movies/:id', to: 'movies#show'
end
