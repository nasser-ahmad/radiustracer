class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
    	t.string :note
    	t.integer :isp_id

    end
  end
end
