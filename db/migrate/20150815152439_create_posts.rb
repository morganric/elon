class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :user_id
      t.text :body
      t.text :summary
      t.string :audio
      t.string :image
      t.integer :plays
      t.string :url
      t.boolean :published
      t.boolean :hidden

      t.timestamps null: false
    end
  end
end
