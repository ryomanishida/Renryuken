Rails.application.routes.draw do

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

  # 会員
  resources 'items', only: [:index, :show], to: 'public/items#'

end
