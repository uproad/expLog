class AddExpToUsers < ActiveRecord::Migration[5.1]
  def change
  	 add_column :users, :exp, :integer
  end
end
