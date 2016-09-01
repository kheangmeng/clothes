Rails.application.routes.draw do
  get 'page/about'

  get 'page/contact'

  devise_for :users
	root "products#index"
  resources :products
  get 'adminPage' => 'products#adminPage', as: 'adminPage'
  resources :colors, except: [:show, :destroy] 
  resources :brands, except: [:show, :destroy]
  resources :categories, except: [:show, :destroy]
	get 'categoryPro/:id' => 'categories#categoryPro', as: 'categoryPro'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
