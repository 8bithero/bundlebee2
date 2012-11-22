class Api::V1::UsersController < Api::V1::BaseController
  #before_filter :find_project, :only => [:show, :update, :destroy]
  #before_filter :authenticate_user!

  # FILTERS
  #-------------------------------------------------------------------
  skip_before_filter :authenticate_user, :only => [:create]


  # GET api/v1/users/:id.json                                      
  #-------------------------------------------------------------------
  def show
    if current_user.id == params[:id].to_i
      respond_with(current_user, :location => api_v1_user_path(current_user))
    else
      raise "nosir"
    end
    #respond_with(current_user)
  end


  # POST api/v1/users.json                                        
  #-------------------------------------------------------------------
  def create
    user_params = params
    user_params.reject!{ |k| k == 'token' }
    user_params.reject!{ |k| k == 'action' }
    user_params.reject!{ |k| k == 'controller' }

    user = User.create(user_params)
    if user.valid?
      respond_with({:success  => true, 
                    :message  => "User account for #{user.email} has been successfully created."}, 
                    :status   => 201, 
                    :location => "nil")
    else
      respond_with({:success  => false, 
                    :message  => "A user account for #{user.email} could not be created."}, 
                    :status   => 500, 
                    :location => "nil")
    end
  end

  private

    def find_project
      @project = Project.for(current_user).find(params[:id])
      rescue ActiveRecord::RecordNotFound
        error = { :error => "The project you were looking for " +
                            "could not be found."}
        respond_with(error, :status => 404)
    end
end