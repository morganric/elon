class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :display_name
      t.text :bio
      t.string :image
      t.string :slug
      t.string :website

      t.timestamps null: false
    end
  end
end
