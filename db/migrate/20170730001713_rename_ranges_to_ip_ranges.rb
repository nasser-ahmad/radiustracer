class RenameRangesToIpRanges < ActiveRecord::Migration[5.1]
  def change
  	    rename_table :ranges, :ip_ranges
  end
end
