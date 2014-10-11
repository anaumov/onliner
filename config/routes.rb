Rails4Template::Application.routes.draw do
  devise_for :users
  self.default_url_options Settings.app.default_url_options.symbolize_keys

  ## scope subdomain: 'api', constraints: { subdomain: 'api' } do
  #mount GrapeSwaggerRails::Engine => '/api'
  #mount API => '/api'

  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  root 'welcome#index'

  namespace :admin do
    resources :events
  end

  resources :events, only: [:index, :new, :create]
  resources :onlines, only: [:index, :new, :create, :update, :destroy]
  resources :photos, only: [:index, :create]

  post "messages" => 'messages#create', as: 'messages'
  get "last_messages" => 'messages#last_messages'

  get "events" => 'events#index'

  get "my" => 'my/profile#index', as: 'profile'
  namespace :my do
    get "edit" => 'profile#edit', as: 'edit_profile'
    put "update" => 'profile#update', as: 'update_profile'
  end

  get "events/:date" => 'events#events_by_date', as: 'events_by_date'
  get "events/:date/:slug" => 'events#show', as: 'event_date_slug'


  get ":username" => 'users#show', as: 'user'
  get ":username/:id" => 'onlines#show', as: 'user_online'

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

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
