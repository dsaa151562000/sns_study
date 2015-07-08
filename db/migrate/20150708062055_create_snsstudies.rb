class CreateSnsstudies < ActiveRecord::Migration
  def change
    create_table :snsstudies do |t|
      t.string :name
      t.text :introduction

      t.timestamps
    end
  end
end
