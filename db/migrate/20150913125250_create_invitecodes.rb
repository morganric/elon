class CreateInvitecodes < ActiveRecord::Migration
  def change
    create_table :invitecodes do |t|
      t.string :name
      t.integer :ammount
      t.integer :used

      t.timestamps null: false
    end
  end
end
