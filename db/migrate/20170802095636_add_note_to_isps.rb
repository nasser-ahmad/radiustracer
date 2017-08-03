class AddNoteToIsps < ActiveRecord::Migration[5.1]
  def change
    add_column :isps, :note, :string
  end
end
