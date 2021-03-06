ActionController::Routing::Routes.draw do |map|
  map.resources :moderation_requests

  map.resources :users, :only => [:index, :admintoggle, :new, :create]  do |user|
    
    user.resource :password,
      :controller => 'clearance/passwords',
      :only       => [:create, :edit, :update]

  end


  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"
  
  map.root :controller => 'episodios'

  # See how all your routes lay out with "rake routes"

  map.sign_out 'sign_out',
    :controller => 'sessions',
    :action     => 'destroy',
    :method     => :delete
    
    
  map.contato 'contato',
    :controller => 'nerdtrack',
    :action     => 'contato'

  map.sobre 'sobre',
    :controller => 'nerdtrack',
    :action     => 'sobre'

  map.equipe 'equipe',
    :controller => 'nerdtrack',
    :action     => 'equipe'

  map.user_profile 'u/:id',
    :controller => 'profile',
    :action    => 'show'

  map.quote_voteup 'quotes/voteup/:id',
    :controller => 'quotes',
    :action => 'voteup'

  map.quote_votedown 'quotes/votedown/:id',
    :controller => 'quotes',
    :action => 'votedown'  
    
  map.quote_top 'quotes/top',
    :controller => 'quotes',
    :action => 'top'
    
    
  # Resources
  map.resources :tracks

  map.resources :quotes

  map.resources :episodios
  
  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  map.connect ':controller/:action'
end
