class AddSubnetMaskToIpRanges < ActiveRecord::Migration[5.1]
  def change
    add_column :ip_ranges, :subnet_mask, :string
  end
end
