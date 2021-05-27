Rails.application.routes.draw do
  resources :loans, defaults: {format: :json} do
    resources :payments, only: %i[create index], defaults: { format: :json }
  end

  resources :payments, only: :show, defaults: { format: :json }
end
