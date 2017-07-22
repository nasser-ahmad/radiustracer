class AddColumnTimestampsToRequestsTable < ActiveRecord::Migration[5.1]
  def change
  	add_column :requests , :created_at , :datetime
  	add_column :requests , :updated_at , :datetime
  end
end
