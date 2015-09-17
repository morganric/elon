class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :name
      t.integer :total
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
