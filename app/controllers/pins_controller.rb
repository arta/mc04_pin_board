class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  # GET /pins
  # link_to .. pins_path
  def index
    @pins = Pin.order( created_at: :desc )
  end

  # GET /pins/new
  # link_to .. new_pin_path
  def new
    @pin = current_user.pins.new
    # @pin = Pin.new
  end

  # POST /pins
  # form_for @pin                 if new_record?
  def create
    @pin = current_user.pins.new pin_params
    # @pin = Pin.new pin_params
    if @pin.save
      redirect_to @pin, notice: 'Pin successfully created.'
    else
      render 'new'
    end
  end

  # GET /pins/:id
  # link_to .. @pin [ pin_path( @pin ) ]
  #   [ pass @pin in /index; supplied implicitly in responses to requests with :id ]
  # redirect_to @pin
  def show; end

  # GET /pins/:id/edit
  # link_to .. edit_pin_path( @pin )
  #   [ pass @pin in /index; supplied implicitly in responses to requests with :id ]
  def edit; end

  # PATCH /pins/:id
  # PUT /pins/:id
  # form_for @pin                 if persisted?
  def update
    if @pin.update pin_params
      redirect_to @pin, notice: 'Pin successfully updated.'
    else
      render 'edit'
    end
  end

  # DELETE /pins/:id
  # link_to .. @pin [ pin_path( @pin ) ], method: :delete
  #   [ pass @pin in /index; supplied implicitly in responses to requests with :id ]
  def destroy
    @pin.destroy
    redirect_to root_path, notice: 'Pin successfully destroyed.'
  end

  # CUSTOM ACTIONS ############################################
  # PUT /pins/:id/like
  # link_to like_pin_path( @pin ), method: :put do
  def upvote
    @pin.upvote_by current_user
    redirect_to :back, notice: 'Pin was upvoted!'
    # redirect_to request.referer || root_path, notice:'Link upvoted!'
  end

  # PUT /pins/:id/dislike
  # link_to dislike_pin_path( @pin ), method: :put do
  def downvote
    @pin.downvote_by current_user
    redirect_to :back, notice: 'Pin was downvoted!'
     # redirect_to request.referer || root_path, notice:'Link downvoted!'
  end

  private
    def pin_params
      params.require( :pin ).permit( :title, :description, :image )
    end

    def set_pin
      @pin = Pin.find params[:id]
    end
end
