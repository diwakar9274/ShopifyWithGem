Rails.application.routes.draw do
  root "home#index"
  get 'orders',to: 'orders#index'
  get 'products',to: "products#index"
end
