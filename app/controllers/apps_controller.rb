class AppsController < ApplicationController
  load_and_authorize_resource
  #before_filter :find_app,:only=> [:show,:edit,:update,:destroy]
  
  def index
    @apps = App.accessible_by(current_ability)
  end


  def show
    @app = App.find(params[:id])
  end
  

  private
    def find_app
      @app = App.for(current_user).find(params[:id])
      
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The app you were looking for could not be found."
      redirect_to apps_path
    end
end
