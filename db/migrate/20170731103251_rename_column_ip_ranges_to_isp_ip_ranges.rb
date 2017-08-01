class RenameColumnIpRangesToIspIpRanges < ActiveRecord::Migration[5.1]
  def change
  	rename_column :isps , :ip_ranges , :isp_ip_ranges
  end
end
