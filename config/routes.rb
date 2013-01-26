PlayedbyMeHh::Application.routes.draw do

  get "/", :to =>  "sessions#new"

  get "static_pages/new"

  get "/parties/search", :to => 'party_profiles#search'

  get "/search", :to => 'party_profiles#display'
 
  get "party_profiles/display", :to => 'party_profiles#display'

  get '/songs', :to => 'songs#show'

  resources :guests

  resources :api_parties 

  get "/party_profiles/:id/_showplaylist", :to => 'party_profiles#showplaylist'

  resources :party_profiles do
    member do
      get :showplaylist
      get :search
      get :display
      get :displayresults
    end
  end

  get '/songplayed', :to => 'songs#songplayed'
  get '/songplayed?soundcloud_id=:soundcloud_id&party_profile_id=:party_profile_id', :to => 'songs#songplayed'
  get '/songs/destroy?name=:name&party_profile_id=:party_profile_id', :to => 'songs#destroy'
  get "/searchsongs", :to => 'songs#search'
  resources :songs do
    member do
      get :search
      get :songplayed
    end
  end


  resources :users

  get   '/login', :to => 'sessions#new', :as => :login
  match '/auth/:provider/callback', :to => 'sessions#create'

  resources :sessions

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
