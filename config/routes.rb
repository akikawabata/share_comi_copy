Rails.application.routes.draw do
  #ゲストログイン設定
 devise_scope :member do
   post "members/guest_sign_in", to: "public/sessions#guest_sign_in"
 end
 #adminのルーティング
 namespace :admin do
  get "search" => "searches#search"
  get 'teams/destroy/:id',to: 'teams#confirm', as: 'teams_destroy'
  resources :teams, only: [:new, :create, :edit, :index, :update, :destroy, :show]
  resources :members
    get 'members/destroy'     => 'members#confirm'
  resource :customers, only: [:show, :edit, :update]
  end

 devise_scope :admin do
   post "admin/guest_sign_in", to: "admin/sessions#guest_sign_in"
 end

 devise_for :members, controllers: {
    sessions: 'public/sessions'#
  }
#   skip: [:registrations],
#デバイスのルート設定 デバイスが用意したコントロールを使う
 devise_for :admin, controllers: {#
    registrations: 'admin/registrations',
    sessions: 'admin/sessions'#
  }

 root to: 'homes#top'

 #memberのルーティング
 namespace :public do
 get "search" => "searches#search"
  resource :members, only: [:show, :edit, :update]
  resources :member_tasks, only: [:index]
  # post 'member_tasks'     => 'member_tasks#index'
  resources :member_lists, only: [:index]
  resources :projects
    patch 'projects/:id'     => 'projects#status'
    get 'project/candidates'     => 'projects#draft'
  resources :project_schedules, only: [:index]
 end

end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
