class AddPasswordDigestToSnsstudies < ActiveRecord::Migration
  def change
    add_column :snsstudies, :password_digest, :string
  end
end
