# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :coins, only: [:create]
  resources :users, except: [:index, :show, :create, :new, :edit, :destroy] do
    delete 'monster/:monster_id', to: 'monsters#destroy'
  end
end
