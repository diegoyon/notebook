Rails.application.routes.draw do
  root "notes#index"
  get '/notes', to: "notes#index" 
  get '/notes/:id', to: "notes#show" 

end
