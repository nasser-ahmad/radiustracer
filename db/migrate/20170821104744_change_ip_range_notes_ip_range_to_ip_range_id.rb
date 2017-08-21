class ChangeIpRangeNotesIpRangeToIpRangeId < ActiveRecord::Migration[5.1]
  def change
  	rename_column :ip_range_notes , :ip_range , :ip_range_id
  end
end
