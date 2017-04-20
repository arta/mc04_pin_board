class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  # POST /pins/:pin_id/comments
  #   html: <form action='/pins/1/comments' method='post' ..
  #   haml: =form_for [ @pin, Comment.new ] ..       ... on /pins/show
  #   router: resources :pins do .. resources :comments, only: :create ..
  #           ( post '/pins/:pin_id/commets', to: comments#create, as: pin_comments )
  #           ( pin_comments_path( @pin ), method: :post )
  def create
    @pin = Pin.find params[:pin_id]
    @comment = @pin.comments.new( comment_params )
    @comment.user = current_user

    # No fussing with correcting comment's errors (i.e. @comment.body.blank?)
    # = save if user types the @comment.body; @comment.valid? == true
    # = don't save if user posts @comment.body.blank?; @comment.invalid? == true
    # (contrast with a01_raddit)
    flash[:notice] = 'Thanks for commenting!' if @comment.save
    redirect_to @pin
  end

  def destroy
  end

  private
    def comment_params
      params.require( :comment ).permit( :body )
    end
end
