class CreateSnsstudies < ActiveRecord::Migration
  def change
    create_table :snsstudies do |t|
      t.string :name
      t.text :introduction

      t.timestamps
    end
    add_index :relationships, :follower_id
    add_index :relationships, :followed_id
    add_index :relationships, [:follower_id, :followed_id], unique: true
  end
end
