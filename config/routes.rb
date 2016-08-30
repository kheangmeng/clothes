Rails.application.routes.draw do
  get 'page/about'

  get 'page/contact'

  devise_for :users
	root "products#index"
  resources :products
  resources :colors, except: :show
  resources :brands, except: :show
  resources :categories, except: :show
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
