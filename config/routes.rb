Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#index'

  get '/members', to: 'members#index', as: 'members'
  post '/members', to: 'members#create'
  get '/members/new', to: 'members#new', as: 'new_members'
  get '/members/:id/edit', to: 'members#edit', as: 'edit_members'
  get '/members/:id', to: 'members#show', as: 'member'
  put '/members/:id/edit', to: 'members#update'
  delete '/members/:id', to: 'members#destroy'
  
end
