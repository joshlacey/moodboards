class CreateBoards < ActiveRecord::Migration[5.1]
  def change
    create_table :boards do |t|
      t.string :title
      t.integer :project_id
      t.timestamps 
    end
  end
end
