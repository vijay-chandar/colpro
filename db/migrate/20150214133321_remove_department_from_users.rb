class RemoveDepartmentFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :department, :integer
  end
end
