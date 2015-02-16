class RemoveDesignationFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :designation, :string
  end
end
