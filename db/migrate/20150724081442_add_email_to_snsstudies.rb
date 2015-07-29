class AddEmailToSnsstudies < ActiveRecord::Migration
  def change
    add_column :snsstudies, :email, :string
  end
end
