Rails.application.routes.draw do

  get('/home', {:controller => 'users', :action => 'home'})

  get('/my_cart', {:controller => 'carts', :action => 'my_cart'})
  get('/my_items', {:controller => 'items', :action => 'my_items'})
  get('/my_clubs', {:controller => 'clubs', :action => 'my_clubs'})
  get('/purchase_items', {:controller => 'carts', :action => 'purchase_items'})

  get('/club_emails/:id', {:controller => 'emails', :action => 'club_emails'})
  post('/import_emails/:id', {:controller => 'emails', :action => 'import_emails'})

  get('/view_report/:id', {:controller => 'items', :action => 'view_report'})

  devise_for :users
  root to: "users#home"

  resources :universities

  resources :selected_items

  resources :carts

  resources :memberships

  resources :items

  resources :emails

  resources :clubs

  resources :club_admins

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
