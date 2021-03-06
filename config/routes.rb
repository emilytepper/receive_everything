ReceiveEverything::Application.routes.draw do
  resources :comments do
    member do
      get :reply
    end
  end

  resources :share_links do
    member do
      get :sharer
      put :shared
    end
  end

  resources :goddesses
  resources :purchases do
    collection do
      get :mine
    end
  end

  devise_for :creatrixes
  resources :prices

  resources :inclusions do
    member do
      put :move_higher
      put :move_lower
    end
  end
  
  resources :accesses

  resources :products do
    resources :inclusions
    member do
      get :display
      put :move_higher
      put :move_lower
    end
    collection do
      get :browse
    end
  end

  resources :meditations do
    collection do
      get :browse
    end
    member do
      get :display
    end
  end

  devise_for :mystics
  resources :mystics do
    collection do
      get :logged_in
      post :grant
    end
  end
  get 'facebook_new_session' => 'facebook#new_session', :as => 'new_session_facebook'
  
  root :to => 'products#browse'
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
