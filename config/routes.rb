Rails.application.routes.draw do
  # resources :pins
  get    'pins',          to: 'pins#index'
  get    'pins/new',      to: 'pins#new', as: 'new_pin' # must precede greedy `GET 'pins/:id'`
  post   'pins',          to: 'pins#create'
  get    'pins/:id',      to: 'pins#show', as: 'pin' # must name conventionally
                                                     # for `redirect_to @pin` to work
                                                     # because 3 other verbs act on 'pins/:id'
                                                     # ( PATCH, PUT, DELETE )
  get    'pins/:id/edit', to: 'pins#edit', as: 'edit_pin'
  match  'pins/:id',      to: 'pins#update', via: [:patch, :put]
  # patch 'pins/:id',      to: 'pins#update'
  # put   'pins/:id',      to: 'pins#update'
  delete 'pins/:id',      to: 'pins#destroy'

  root 'pins#index'
end
