class CreateRanges < ActiveRecord::Migration[5.1]
  def change
    create_table :ranges do |t|
      t.string :range
      t.integer :isp_id
      t.string :note
    end
  end
end
