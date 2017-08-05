class CreateIspHrs < ActiveRecord::Migration[5.1]
  def change
    create_table :isp_hrs do |t|
    	t.string :name
    	t.string :job
    	t.string :home_n
    	t.string :home_n2
    	t.string :work_n
    	t.string :work_n2
    	t.string :mob_n
    	t.string :mob_n2
    	t.timestamps
    end
  end
end
