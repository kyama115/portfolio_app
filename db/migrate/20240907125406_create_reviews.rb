class CreateReviews < ActiveRecord::Migration[7.2]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :shop, null: false, foreign_key: true
      t.string :title
      t.text :content
      t.integer :rating
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
