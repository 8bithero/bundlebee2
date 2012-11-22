class Api::V1::BaseController < ActionController::Base
  
  # Responses
  #-----------------------------------------------------------------------
  respond_to :json

  # Filters
  #-----------------------------------------------------------------------
  load_and_authorize_resource

  # Error handling
  #-----------------------------------------------------------------------
  rescue_from ActiveRecord::RecordNotUnique,  :with => :duplicate_record
  #rescue_from ActionController::RoutingError, :with => :routing_problems

  private

    #def routing_problems
    #  error = { success: false, message: "The resource you are trying to access is either " +
    #                                     "not accessible or cannot be found." }
    #  respond_with(error, status: 501, location: "nil")  
    #end

    def duplicate_record
      error = { success: false, message: "This app has already been added to your sandbox." }
      respond_with(error, status: 409, location: "nil")
    end

    def authenticate_user
      @current_user = User.find_by_authentication_token(params[:token])
      unless @current_user
        error = { success: false, message: "Token is invalid." }
        respond_with(error, status: 401, location: "nil")
      end
    end

    def current_user
      @current_user
    end
end
