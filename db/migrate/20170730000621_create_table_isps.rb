class CreateTableIsps < ActiveRecord::Migration[5.1]
  def change
    create_table :isps do |t|
    	t.string :name
    	t.string :ip_ranges
    	t.timestamps
    end
  end
end
