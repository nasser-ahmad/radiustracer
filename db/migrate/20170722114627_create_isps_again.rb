class CreateIspsAgain < ActiveRecord::Migration[5.1]
  def change
    create_table :isps do |t|
    	t.string :name
    	t.timestamps
    end
  end
end
