class ChangeIspsRangesColumn < ActiveRecord::Migration[5.1]
  def change
  	change_column :isps , :ranges , :ip_ranges
  end
end
