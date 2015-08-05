Rails.application.routes.draw do

# get 'home/index
get '/' => "home#index";
get '/about' => "home#about";
get '/results' => "articles#new";

get '/all' => "reports#show"

devise_for :users,  path: "",
            path_names: {sign_in: "login", sign_up: "signup", sign_out: "logout", about: "about"},
            :controllers => { registrations: 'registrations' }


resources :articles
resources :reports
resources :dashboard, only: :index

resources :reports do
	resources :articles
end

end
