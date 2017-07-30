class DropTableIsps < ActiveRecord::Migration[5.1]
  def change
  	  	drop_table(:ranges)
  end
end
