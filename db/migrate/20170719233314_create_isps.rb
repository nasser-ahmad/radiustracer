class CreateIsps < ActiveRecord::Migration[5.1]
  def change
    create_table :isps do |t|
    	t.string :name
    	t.timestamp
    end
  end
end
