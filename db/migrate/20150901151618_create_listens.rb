class CreateListens < ActiveRecord::Migration
  def change
    create_table :listens do |t|
      t.integer :user_id
      t.integer :post_id

      t.timestamps null: false
    end
    add_index :listens, [:user_id, :post_id], unique: true
  end
end
