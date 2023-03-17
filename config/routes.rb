Rails.application.routes.draw do

  namespace :admin do
    resources :genres
  end
  namespace :public do
    resources :posts, only: [:new, :create, :index, :show, :destroy, :edit] do
       resources :post_comments, only: [:create, :destroy] 
       resource :favorites, only: [:create, :destroy]
       end
    resources :customers, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  end

  get '/' => 'homes#top'
# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
