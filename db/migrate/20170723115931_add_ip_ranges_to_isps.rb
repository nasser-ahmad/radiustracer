class AddIpRangesToIsps < ActiveRecord::Migration[5.1]
  def change
    add_column :isps, :ranges, :string
  end
end
