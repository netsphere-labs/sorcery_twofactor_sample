# -*- coding: utf-8 -*-
# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#index'
  # 単数形 singular resource. Rails ではコントローラ名が複数形になってしまうた
  # め, controller オプションが必要.
  resource :session, controller: 'session'
  
  resources :users
  resource :user_mfa_session, only: %i[new create]

  get 'login' => 'sessions#new', :as => :login
  post 'logout' => 'sessions#destroy', :as => :logout

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
