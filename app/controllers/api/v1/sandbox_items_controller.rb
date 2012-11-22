class Api::V1::SandboxItemsController < Api::V1::BaseController
  #before_filter :find_project, :only => [:show, :update, :destroy]
  #before_filter :authenticate_user!

  def index
    #if params[:app_id] and params[:app_id].present?
    #  app = App.find(params[:app_id])
    #  
    #  if current_user.has_app?(app)
    #    respond_with({:success => true, :message => "Application has been found in your sandbox."}, :status => 200, :location => "nil")
    #  else
    #    respond_with({:success => false, :message => "You have not added this application to your sandbox."}, :status => 200, :location => "nil")
    #  end
    #elsif params[:app_id] and params[:app_id].blank?
    #  respond_with({:success => false, :message => "Please provide an application ID number."}, :status => 200, :location => "nil")
    #else
    #  sandbox = current_user.sandbox_items.all
    #  respond_with(sandbox)
    #end
    respond_with(current_user.apps)
  end


  # GET /api/v1/has_app/:app_id | will check if app exists
  #---------------------------------------------------------------
  def show
    app = current_user.apps.find(params[:app_id])
    respond_with(app)
  
  rescue ActiveRecord::RecordNotFound
    error = { :success => false, :message => "The App you were looking for could not be found in your Sandbox."}
    respond_with(error, :status => 404)
  end


  # POST /api/v1/add_to_sandbox/:app_id
  #---------------------------------------------------------------
  def create
    app = App.find(params[:app_id])
    sandbox_item = current_user.add_app!(app)
    
    if sandbox_item.valid?
      respond_with({:success  => true, 
                    :message  => "#{app.name} was successfully added to your Sandbox."}, 
                    :status   => 201, 
                    :location => "nil")
    else
      respond_with({:success  => false, 
                    :message  => "#{app.name} could not be added to your Sandbox."}, 
                    :status   => 500, 
                    :location => "nil")
    end
  end


  # DELETE /api/v1/remove_from_sandbox/:app_id
  #---------------------------------------------------------------
  def destroy
    app = App.find(params[:app_id])
    sandbox_item = current_user.remove_app!(app)
    respond_with({:success  => true, 
                  :message  => "App was successfully removed from your Sandbox."}, 
                  :status   => 200, 
                  :location => "nil")

  rescue ActiveRecord::RecordNotFound
    error = { :success => false, :message => "The App you were looking for could not be found in your Sandbox."}
    respond_with(error, :status => 404)
  end

  private

    def find_app
      #@app = App.for(current_user).find(params[:id])
      @app = current_user.apps.find(params[:app_id])
      rescue ActiveRecord::RecordNotFound
        error = { :error => "The project you were looking for " +
                            "could not be found."}
        respond_with(error, :status => 404)
    end
end