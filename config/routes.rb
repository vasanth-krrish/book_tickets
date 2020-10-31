Rails.application.routes.draw do

  resources :genres, except: :new
  resources :languages, except: :new

  resources :movies
  root 'movies#index'
  get '/settings' => 'movies#settings', as: 'settings'

  devise_for :users

  resources :theatres
  get '/movie/:movie_id/tickets' => "tickets#index", as: "ticket"
  get '/movie/:movie_timing_id/tickets/new' => "tickets#new", as: "new_ticket"
  post '/tickets' => 'tickets#create', as: 'tickets'
  get '/user/tickets' => 'tickets#show', as: 'user_tickets'

  scope '/theatre/:theatre_id' do
    resources :screens
  end

  scope '/screen/:screen_id' do
    resources :timings
  end

  scope '/movie/:movie_id' do
    resources :movie_timings
  end

  resources :people, except: :new
  scope "/movies/:movie_id" do
    resources :movie_casts, only: [:new, :create, :destroy]
  end
  scope "/movies/:movie_id" do
    resources :movie_crews, only: [:new, :create, :destroy]
  end

  scope 'search' do
    get '' => 'search#create', as: 'create_search'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
