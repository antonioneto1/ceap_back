Rails.application.routes.draw do
  resources :ceaps
  resources :deputados
  resources :despesas
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post 'importe_csv/importe_deputados' , to: 'importe_csv#importe_deputados'
end
