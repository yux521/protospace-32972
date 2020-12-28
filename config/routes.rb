Rails.application.routes.draw do
  root to: 'prototypes#index'
  devise_for :users
  resources :prototypes do
    resources :comments, only: :create
    # doとendで挟むことにより、ルーティングの記述をネストさせることができました。この記述によって、「あるprototypeに対してのコメント」という親子関係を表現したパスが、コメント投稿に必要なリクエストのパスになります。
  end
  resources :users, only: :show
end
