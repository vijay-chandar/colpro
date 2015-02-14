class AddFieldsToUsers < ActiveRecord::Migration
  def change
      add_column :users,:college_name,:string
      add_column :users,:department,:integer
      add_column :users,:mobile_number,:string      
      add_column :users,:first_name,:string
      add_column :users,:last_name,:string
  end
end
