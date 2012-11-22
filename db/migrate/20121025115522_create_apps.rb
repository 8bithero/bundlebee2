class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string  :name,         :null => false,
      t.string  :bundle_id,    :null => false, :unique => true
      t.integer :developer_id, :null => false,
      t.text    :description
      t.string  :icon_url
      t.integer :points,       :null => false
      t.integer :rating
      t.integer :number_of_ratings

      t.timestamps
    end
    add_index :users, :bundle_id, :unique => true
    add_index :users, :developer_id
  end
end
