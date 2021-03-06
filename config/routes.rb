Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :products, only: [:index, :show, :create]
      resources :cart_items, only: [:index, :create, :destroy, :update]
    end
  end
end
