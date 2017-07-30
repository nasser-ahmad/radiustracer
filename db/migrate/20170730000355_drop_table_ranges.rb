class DropTableRanges < ActiveRecord::Migration[5.1]
  def change
  	drop_table(:isps)
  end
end
