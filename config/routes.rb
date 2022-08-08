Rails.application.routes.draw do
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get '/articles', to: 'articles#index'
  #resources :articles #, only: %i[index show create update] 
  post 'login', to: 'access_tokens#create'
  delete 'logout', to: 'access_tokens#destroy'
  post 'sign_up', to: 'registrations#create'
  resources :articles do
    resources :comments, only: %i[index create] 
  end
end
