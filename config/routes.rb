Simfy::Application.routes.draw do


  get "search/index"

  devise_for :user do
    get "/login", :to => "devise/sessions#new"      # Add a custom sign in route for user sign in
    get "/logout", :to => "devise/sessions#destroy" # Add a custom sing out route for user sign out
    get "/register", :to => "devise/registrations#new" # Add a Custom Route for Registrations
  end

  resources :artists, :only => [:show]
  resources :albums, :only => [:show]
  resources :users, :only => [:index, :show] do
    resources :artists
    resources :albums do
      resources :tracks
    end
  end


#this is just simple for test purpose. Can be done with separate controllers
  match '/artists' => 'artists#public_list', :as => :public_artists_list
  match '/albums' => 'albums#public_list', :as => :public_albums_list
  match '/search' => 'search#index', :as => :search

  root :to => "home#index"
# The priority is based upon order of creation:
# first created -> highest priority.

# Sample of regular route:
#   match 'products/:id' => 'catalog#view'
# Keep in mind you can assign values other than :controller and :action

# Sample of named route:
#   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
# This route can be invoked with purchase_url(:id => product.id)

# Sample resource route (maps HTTP verbs to controller actions automatically):
#   resources :products

# Sample resource route with options:
#   resources :products do
#     member do
#       get 'short'
#       post 'toggle'
#     end
#
#     collection do
#       get 'sold'
#     end
#   end

# Sample resource route with sub-resources:
#   resources :products do
#     resources :comments, :sales
#     resource :seller
#   end

# Sample resource route with more complex sub-resources
#   resources :products do
#     resources :comments
#     resources :sales do
#       get 'recent', :on => :collection
#     end
#   end

# Sample resource route within a namespace:
#   namespace :admin do
#     # Directs /admin/products/* to Admin::ProductsController
#     # (app/controllers/admin/products_controller.rb)
#     resources :products
#   end

# You can have the root of your site routed with "root"
# just remember to delete public/index.html.
# root :to => 'welcome#index'

# See how all your routes lay out with "rake routes"

# This is a legacy wild controller route that's not recommended for RESTful applications.
# Note: This route will make all actions in every controller accessible via GET requests.
# match ':controller(/:action(/:id))(.:format)'
end
