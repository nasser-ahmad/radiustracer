class AddTimeToIpRangeNotes < ActiveRecord::Migration[5.1]
  def change
    add_column :ip_range_notes , :created_at , :datetime
  	add_column :ip_range_notes , :updated_at , :datetime
  end
end
