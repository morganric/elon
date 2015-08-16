class AddTagsToPost < ActiveRecord::Migration
  def change
    add_column :posts, :tag_list, :string
    add_column :posts, :slug, :string
  end
end
