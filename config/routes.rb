Rails.application.routes.draw do

  namespace :public do
    get 'cart_items/index'
    get 'cart_items/create'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/new'
    get 'genres/create'
    get 'genres/edit'
    get 'genres/update'
  end
  root to: 'homes#top'

  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}

  # 管理者
  namespace :admin do
    resources :items
  end
  resources :genres, except: [:show, :new], to: 'admin/genres#'
  namespace :admin do
    resources :customers, only: [:index, :show, :edit]
  end

  # 会員
  resources 'items', only: [:index, :show], to: 'public/items#'
  resources 'cart_items', only: [:index, :create, :update, :destroy], to: 'public/cart_items#'
  delete '/cart_items/destroy_all', to: 'public/cart_items#destroy_all'
  
end





#   devise_for :customers, skip: :all
#   devise_scope :customer do
#     get '/customers/sign_up' => 'public/registrations#new'
#     post '/customers' => 'public/registrations#create'
#     get '/customers/sign_in' => 'public/sessions#new'
#     post '/customers/sign_in' => 'public/sessions#create'
#     delete '/customers/sign_out' => 'public/sessions#destroy'
#     patch '/customers/withdraw' => 'public/customers#withdraw'
#   end

#   devise_for :admin, controllers: {
#     sessions: 'admin/sessions'
#   }
#   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

# # Admin
#   get '/admin', to: 'admin/homes#top'

#   namespace :admin do
#     resources :items, except: [:destroy]
#   end

#   namespace :admin do
#     resources :genres, only: [:index, :create, :edit, :update]
#   end

#   namespace :admin do
#     resources :customers, only: [:index, :show, :edit, :update]
#   end

# # できたらやる
#   namespace :admin do
#     resources :orders, only: [:show, :update]
#   end

#   namespace :admin do
#     get '/orders/:order_details/:id', to: 'admin/order_details#update'
#   end

# # 会員
#   root to:'public/homes#top'
#   get '/about', to:'public/homes#about'

#   resources :items, only: [:index, :show], to: 'public/items#'

#   resource :customers, only: [:edit, :update], to: 'public/customers#'
#   get '/customers/my_page', to:'public/customers#show'
#   get '/customers/unsubscribe', to:'public/customers#unsubscribe'

#   get '/orders/complete', to: 'public/orders#complete'
#   post '/orders/confirm', to: 'public/orders#confirm'
#   resources :orders, only: [:new, :create, :index, :show], to: 'public/orders#'

#   resources :addresses, except: [:show, :new], to: 'public/addresses#'