class AddIspIdToIspHrs < ActiveRecord::Migration[5.1]
  def change
    add_column :isp_hrs, :isp_id, :integer  	
  end
end
