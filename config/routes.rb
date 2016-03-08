require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web, at: "/sidekiq"
  scope '(api)' do
    scope "(v1)" do
      resources :users, only: [:create]
    end
  end


end
