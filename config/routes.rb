Rails.application.routes.draw do

  get('/home', {:controller => 'users', :action => 'home'})

  get('/my_cart', {:controller => 'carts', :action => 'my_cart'})
  get('/my_items', {:controller => 'items', :action => 'my_items'})
  get('/my_clubs', {:controller => 'clubs', :action => 'my_clubs'})
  get('/purchase_items', {:controller => 'carts', :action => 'purchase_items'})

  get('/moolah_icon', {:controller => 'pages', :action => 'moolah_icon'})

  get('/club_emails/:id', {:controller => 'emails', :action => 'club_emails', :as => "club_emails"})
  post('/import_emails/:id', {:controller => 'emails', :action => 'import_emails', :as => "import_emails"})

  get('/leadership/:id', {:controller => 'clubs', :action => 'leadership', :as => "leadership"})

  get('/view_report/:id', {:controller => 'items', :action => 'view_report', :as => "view_report"})
  get('/mark_paid/:item_id/:user_id', {:controller => 'items', :action => 'mark_paid', :as => "mark_paid"})

  devise_for :users, :controllers => {  :registrations => "registrations" }
  #devise_for :users, :controllers => {  :registrations => "registrations", :omniauth_callbacks => "users/omniauth_callbacks" }

  root to: "users#home"

  post '/venmo_pay' => 'items#venmo_pay', :as => 'venmo_pay'
  # get '/auth/venmo/callback' => 'users/omniauth_callbacks#venmo'

  resources :color_options

  resources :size_options

  resources :universities

  resources :selected_items

  resources :carts

  resources :memberships

  resources :items

  resources :emails

  resources :clubs

  resources :club_admins


end
