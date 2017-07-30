class CreateRangesAgain < ActiveRecord::Migration[5.1]
  def change
    create_table :ranges do |t|
    	t.string :ip_range
    	t.integer :isp_id
    	t.string :note
    	t.timestamps
    end
  end
end
