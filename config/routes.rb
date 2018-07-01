Rails.application.routes.draw do
  resources :blogs do
    collection do
      post :confirm
    end
  end
  root to: 'blogs#main'
  get '/blogs', to: 'blogs#main'
end