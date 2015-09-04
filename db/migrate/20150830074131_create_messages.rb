class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :messe
      t.integer :snsstudy_id
      t.integer :to_snsstudy_id

      t.timestamps
    end

     add_index :messages, [:snsstudy_id, :created_at]
  end
end
