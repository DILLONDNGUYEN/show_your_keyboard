class CreateUsersTab < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.timestamps
      t.string :email
    end
  end
end
