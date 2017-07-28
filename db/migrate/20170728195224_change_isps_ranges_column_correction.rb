class ChangeIspsRangesColumnCorrection < ActiveRecord::Migration[5.1]
  def change
  	  	change_column :isps , :ranges , :string
  	  	rename_column :isps , :ranges , :ip_ranges

  end
end
