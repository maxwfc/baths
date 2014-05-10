class FixEncryptedPasswordName < ActiveRecord::Migration
  def change
    rename_column :users, :encrypted_password, :crypted_password
  end
end
