class App < ActiveRecord::Base
  attr_accessible :bundle_id, :name, :description, :icon_url, :points, :rating

  validates :name,         presence: true
  validates :developer_id, presence: true
  validates :bundle_id,    presence: true, uniqueness: true
  validates :points,       inclusion: 1..10

  #has_many :sandbox_items
  #has_many :users, through: :apps_users
end