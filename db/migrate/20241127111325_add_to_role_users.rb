class AddToRoleUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :role, :string, default: 0, null: false
  end
end
