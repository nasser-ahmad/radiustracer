class CreateActionTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :action_types do |t|
      t.string :action_type
    end
  end
end
