Rails.application.routes.draw do
  resources :events

  #devise_for :users
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :projects, :packets
  resources :project, :packet, :comment,  :user, :user_packet, :user_project,:userpacket, :userproject, :role
  resources :home
  resources :packet

  get '/landing', to: 'home#landing'
  get '/', to: 'home#landing'
  get 'create_project', to: 'projects#new'
  get 'create_packet', to: 'packets#new'
  get '/project', to: 'packets#show'
  get 'dashboard', to: 'packets#dashboard'

  post 'project', to: 'packets#show'


  post "/packets/new", to: 'packets#create'
  post "create_project", to: 'projects#create'


  get 'pages/index' => 'high_voltage/pages#show', id: 'index'

  # See how all your routes lay out with "rake routes".
  # The priority is based upon order of creation: first created -> highest priority.

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
