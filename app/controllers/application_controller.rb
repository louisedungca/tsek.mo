class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_error

  private

  def record_not_found_error
    flash[:alert] = "Hmm. The #{controller_name.singularize} that you are looking for does not exist."
    redirect_to root_path
  end
end
