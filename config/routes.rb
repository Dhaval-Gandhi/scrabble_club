Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#index'

  get '/members', to: 'members#index', as: 'members'
  post '/members/new', to: 'members#create'
  get '/members/new', to: 'members#new', as: 'new_members'
  get '/members/:id/edit', to: 'members#edit', as: 'edit_members'
  get '/members/:id', to: 'members#show', as: 'member'
  put '/members/:id/edit', to: 'members#update'
  post '/members/:id/destroy', to: 'members#destroy', as: 'destroy_members'

  get '/games', to: 'games#index', as: 'games'
  post '/games/new', to: 'games#create'
  get '/games/new', to: 'games#new', as: 'new_games'
  get '/games/:uuid/edit', to: 'games#edit', as: 'edit_games'
  get '/games/:uuid', to: 'games#show', as: 'game'
  
end
