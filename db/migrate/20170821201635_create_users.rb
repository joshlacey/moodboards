class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.boolean :admin, default: false
      t.string :password_digest
      t.string :last_name
      t.string :email
    end
  end
end
