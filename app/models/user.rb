class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable


  # ACCESSIBLE ATTRIBUTES
  # Setup accessible (or protected) attributes for your model
  #-----------------------------------------------------------------------
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me


  # FILTERS
  #-----------------------------------------------------------------------  
  before_save :ensure_authentication_token


  # ASSOCIATIONS
  #-----------------------------------------------------------------------
  has_many :sandbox_items
  has_many :installed_apps, through: :sandbox_items
  has_many :apps, foreign_key: :developer_id


  # METHODS
  #-----------------------------------------------------------------------

  # User
  #-----------------------------------------------------------------------
  def has_app?(the_app)
    sandbox_items.find_by_app_id(the_app.id)
  end

  def add_app!(the_app)
    sandbox_items.create!(app_id: the_app.id)
  end

  def remove_app!(the_app)
    sandbox_items.find_by_app_id(the_app.id).destroy
  end

  # Developer
  #-----------------------------------------------------------------------

  # Admin
  #-----------------------------------------------------------------------
  
end
