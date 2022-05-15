# -*- coding: utf-8 -*-
# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'

  # 単数形 singular resource. Rails ではコントローラ名が複数形になってしまうた
  # め, controller: オプションが必要.
  resource :session, controller: 'session', only: %i[create]
  # 'login_path' が出来る.
  get 'login' => 'session#new' #, :as => :login
  post 'logout' => 'session#destroy' #, :as => :logout

  resource :user_mfa_session, only: %i[new create],
                              controller: 'user_mfa_session'

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
