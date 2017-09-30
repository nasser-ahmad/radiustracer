class CreateIspAdslAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :isp_adsl_accounts do |t|
      t.integer :isp_id
      t.string :account
      t.string :adsl_password
      t.timestamps
    end
  end
end
