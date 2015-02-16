class AddDesignationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :designation, :integer
  end
end
