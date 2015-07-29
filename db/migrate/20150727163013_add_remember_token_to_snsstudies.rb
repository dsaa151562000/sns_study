class AddRememberTokenToSnsstudies < ActiveRecord::Migration
  def change
  	add_column :snsstudies, :remember_token, :string
    add_index  :snsstudies, :remember_token
  end
end
