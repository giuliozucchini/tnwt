Rails.application.routes.draw do



# get 'home/index
get '/' => "home#index";

devise_for :users,  path: "",
            path_names: {sign_in: "login", sign_up: "signup", sign_out: "logout"}
end
