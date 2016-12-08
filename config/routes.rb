Rails.application.routes.draw do
  devise_for :users

  resources :comments, only: :destroy
  resources :pins do
    member do
      # acts_as_votable:
      put 'like', to: 'pins#upvote'       # PUT /pins/:id/like      like_pin_path( @pin )
      put 'dislike', to: 'pins#downvote'  # PUT /pins/:id/dislike   dislike_pin_path( @pin )
    end
    resources :comments, only: :create
  end

  # get    'pins',          to: 'pins#index'
  # get    'pins/new',      to: 'pins#new', as: 'new_pin' # must precede greedy `GET 'pins/:id'`
  # post   'pins',          to: 'pins#create'
  # get    'pins/:id',      to: 'pins#show', as: 'pin' # must name conventionally
  #                                                    # for `redirect_to @pin` to work
  #                                                    # because 3 other verbs act on 'pins/:id'
  #                                                    # ( PATCH, PUT, DELETE )
  # get    'pins/:id/edit', to: 'pins#edit', as: 'edit_pin'
  # match  'pins/:id',      to: 'pins#update', via: [:patch, :put]
  # # patch 'pins/:id',      to: 'pins#update'
  # # put   'pins/:id',      to: 'pins#update'
  # delete 'pins/:id',      to: 'pins#destroy'

  # 12-8-16: for debugging saga of plural and singular, see /lib/notes/debugging
  # 12-6-16: add user profiles
  resources :profiles,      only: [:index, :show]
  get       'profile/edit', to: 'profiles#edit',   as: 'edit_profile'
  match     'profile',      to: 'profiles#update', as: 'update_profile', via: [:patch, :put]

  root 'pins#index'
end
