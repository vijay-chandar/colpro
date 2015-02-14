class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.integer :type_of_conference
      t.string :paper_title
      t.text :abstract

      t.timestamps null: false
    end
  end
end
