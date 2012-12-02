class Dev::AppsController < Dev::BaseController
  load_and_authorize_resource
  #before_filter :find_app,:only=> [:show,:edit,:update,:destroy]
  #skip_authorization_check

  def index
    @apps = App.accessible_by(current_ability)
  end


  def show
    @app = App.find(params[:id])
  end


  def new
    @app = App.new
  end


  def create
    @app = App.new(params[:app])
    if @app.save
      flash[:notice] = "App has been created."
      redirect_to @app
    else
      flash[:alert] = "App has not been created."
      render :action => 'new'
    end
  end


  def edit 
  end
  

  def update    
    if @app.update_attributes(params[:app])
      flash[:notice] = "App has been updated."
      redirect_to @app
    else
      flash[:alert] = "App has not been updated."
      render :action => "edit"
    end
  end
  
  def destroy
    @app.destroy
    flash[:notice] = "App has been deleted."
    redirect_to apps_path
  end

  private
    def find_app
      @app = App.for(current_user).find(params[:id])
      
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The app you were looking for could not be found."
      redirect_to apps_path
    end
end
