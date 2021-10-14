Rails.application.routes.draw do

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
  # 会員
  resources 'items', only: [:index, :show], to: 'public/items#'

end
