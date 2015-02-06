class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.string :first_name
      t.string :last_name
      t.string :college_name
      t.integer :department
      t.string :email
      t.string :mobile_number
      t.integer :type_of_conference
      t.string :paper_title
      t.text :abstract
      t.attachment :file_upload

      t.timestamps null: false
    end
  end
end
