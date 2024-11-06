class AddTakenToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :oauth_token, :string
    add_column :users, :oauth_expires_at, :datetime
  end
end
