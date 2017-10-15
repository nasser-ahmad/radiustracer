class AddRadsAssignsReleaseDatesToRequests < ActiveRecord::Migration[5.1]
  def change
  	add_column :requests , :rad_assign_date , :datetime
  	add_column :requests , :rad_release_date , :datetime
  	add_column :requests , :has_error , :boolean, default: false
  end
end
