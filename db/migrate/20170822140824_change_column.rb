class ChangeColumn < ActiveRecord::Migration[5.1]
  def change
    change_column :projects, :status, :string, default: "pending"
  end
end
