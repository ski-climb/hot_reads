Rails.application.routes.draw do
  root to: "links#index"

  namespace :api do
    namespace :v1 do
      namespace :links do
        get "/top_link", to: "top_links#show"
        get "/hot_links", to: "hot_links#index"
      end
      resources :links, only: [:create]
    end
  end
end
