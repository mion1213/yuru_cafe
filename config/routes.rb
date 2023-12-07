Rails.application.routes.draw do
  # 顧客用
  # URL /user/sign_in ...
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  scope module: :public do
    
    resources :posts, only: [:index, :create, :update, :destroy] do
      resource :bookmarks, only: [:index, :show, :create, :destroy]
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
  
    
    root to: "homes#top"
    get 'home/about' => 'homes#about' , as: "about"
  end
  
  namespace :public do
    get '/customers/profile' => 'customers#show'
    get '/customers/profile/edit' => 'customers#edit'
    patch '/customers/profile' => 'customers#update'
    get  '/customers/profile/check' => 'customers#check'
    patch  '/customers/profile/withdraw' => 'customers#withdraw'
  end
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  namespace :admin do
    root to: "homes#top"
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end
end
