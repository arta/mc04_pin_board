class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # 12-8-16, adding profile to devise registration ( the lazy way(TM) )
  # https://github.com/plataformatec/devise#strong-parameters
  # http://guides.rubyonrails.org/form_helpers.html#nested-forms

  before_action :configure_permitted_parameters, if: :devise_controller?

  private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit( :sign_up, keys: [ profile_attributes: [:id, :username, :name] ] )
      devise_parameter_sanitizer.permit( :account_update, keys: [ profile_attributes: [:id, :username, :name] ] )
    end
end
