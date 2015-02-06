class AddRegistrationNumberToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :registration_number, :string
  end
end
