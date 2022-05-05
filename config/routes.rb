Rails.application.routes.draw do
  root 'ceaps#index'
  resources :ceaps
  resources :deputados
  resources :despesas
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post 'ceaps/importe_csv/importe_deputados' , to: 'importe_csv#importe_deputados'
end
