class CreateIpRangeNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :ip_range_notes do |t|
    	t.string :note
    	t.integer :ip_range
    end
  end
end
