class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
    	t.integer :isp_id
    	t.string :public_ip
    	t.string :private_ip
    	t.string :router_ip
    	t.datetime :assign_date
    	t.datetime :release_date
    	t.timestamp
    end
  end
end
