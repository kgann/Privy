Rails.application.routes.draw do

  resources :users,
            :as          => :privy_users,
            :only        => [:index, :show, :edit, :create],
            :path        => Privy::PrivyEngine.config.mount_point,
            :controller  => 'privy/users'

  match '/login'  => 'privy/login#index',  :via => 'get'
  match '/login'  => 'privy/login#login',  :via => 'post'
  match '/logout' => 'privy/logout#index', :via => 'get'

end