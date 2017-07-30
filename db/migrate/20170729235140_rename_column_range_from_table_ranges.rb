class RenameColumnRangeFromTableRanges < ActiveRecord::Migration[5.1]
  def change
  	rename_column :ranges , :range , :ip_range
  end
end
