class CreateTsubyakis < ActiveRecord::Migration
  def change
    create_table :tsubyakis do |t|
      t.string :content
      t.integer :snsstudy_id

      t.timestamps
    end
  end
end
