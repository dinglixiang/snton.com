SntonCom::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  namespace :admin do
    root "topics#index"
    resources :topics do
      collection do
        put 'publish'
        put 'ban'
        get 'published'
        get 'banned'
        get 'drafted'
        get 'about'
        get 'job'
        get 'contact'
      end
    end
  end

  root "dashboard#index"
  resources :topics, only: [:show, :index]
  get 'about', to: "topics#about", as: 'about'
  get 'job', to: "topics#job", as: 'job'
  get 'contact', to: "topics#contact", as: 'contact'
  get 'certification', to: "topics#certification", as: 'certification'

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
