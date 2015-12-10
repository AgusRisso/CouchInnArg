Rails.application.routes.draw do
  
  resources :lodgingtypes
  resources :lodgings
  resources :valorar_hs
  resources :reservations
  resources :premiums
  resources :profit
  resources :valorateguests

  get '/premium' => 'premium#index'
  get '/nuevotipo' =>'lodgingtypes#new'
  get '/vertipos'=> 'lodgingtypes#index'
  get '/listahospedajes'=> 'lodgings#index'
  get '/verhospedaje/:id'=> 'lodgings#show'
  get '/lodgingtypes/recuperar/:id' => 'lodgingtypes#recuperar'
  get '/hospedajes/mostrar' => 'lodgings#mostrar'
  get '/hospedajes/valoracionhospedajerecibida' => 'valorar_hs#valoracionhospedajerecibida'

  resources :valorar_hs do
  
    get 'valoracionhospedajerecibida', on: :member

  end

  
  resources :reservations do

    get 'actualizar', on: :member

  end

  resources :lodgingtypes do
 
    get 'recuperar', on: :member 

  end

  resources :lodgings do

    get 'confirmadas', on: :member
    get 'mostrar', on: :member
    get 'reservas', on: :member

  end

  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
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
