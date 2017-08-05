class AddAddressToIspHrs < ActiveRecord::Migration[5.1]
  def change
    add_column :isp_hrs, :address, :string
  end
end
