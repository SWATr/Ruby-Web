Rails.application.routes.draw do
  get 'admin' => 'admin#index'

  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  #get 'admin/index'
  #get 'sessions/new'
  #get 'sessions/create'
  #get 'sessions/destroy'
  #get 'store/index'

  scope '(:locale)' do
    resources :users
    resources :orders
    resources :static_pages
    resources :line_items
    resources :carts
    resources :products do
      get :who_bought, on: :member
    end
    root to: 'store#index', as: 'store'
    #get '/:id' => 'static_pages#show'
  end
end
