class ProfilesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  before_action :authenticate_user!

  # GET /profiles            link_to ... profiles_path
  def index
    @profiles = Profile.all
  end

  # GET /profiles/:id
  # rescue bad :id with record_not_found
  def show
    @profile = Profile.find( params[:id] )
  end

  # GET /profile/edit        link_to ... edit_profile_path
  def edit
    @profile = current_user.profile
  end

  # PATCH|PUT /profile       form_for @profile, url: update_profile_path
  def update
    @profile = current_user.profile

    if @profile.update( profile_params )
      redirect_to @profile, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:user_id, :username, :name, :dob, :location, :hobbies, :profession)
    end

    def record_not_found
      redirect_to request.referer || root_path, notice: 'That profile does not exist.'
    end
end
