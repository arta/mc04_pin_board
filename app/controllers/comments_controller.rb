class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  # POST /pins/:pin_id/comments
  # pin_comments_path( @pin ), method: :post
  # form_for [ @pin, @pin.comments.new ]       ... on 'pins#show' page
  def create
    @pin = Pin.find params[:pin_id]
    @comment = @pin.comments.new( comment_params )
    @comment.user = current_user

    # no fussing with correcting errors (blank comment.body),
    #   just type in the damn comment! :) (contrast with a01_raddit)
    flash[:notice] = 'Thanks for commenting!' if @comment.save # don't save if :body not present
    redirect_to @pin
  end

  def destroy
  end

  private
    def comment_params
      params.require( :comment ).permit( :body )
    end
end
