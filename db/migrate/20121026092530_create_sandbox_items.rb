class CreateSandboxItems < ActiveRecord::Migration
  def change
    create_table :sandbox_items do |t|
      t.references :user
      t.references :app

      t.timestamps
    end
    add_index :sandbox_items, :user_id
    add_index :sandbox_items, :app_id
    add_index :sandbox_items, [:user_id, :app_id], unique: true
  end
end
