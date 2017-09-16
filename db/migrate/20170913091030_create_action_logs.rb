class CreateActionLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :action_logs do |t|
      t.string :username
      t.integer :action_type
      t.boolean :finished
      t.string :notice
      t.timestamps
    end
  end
end
