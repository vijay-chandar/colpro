class AddUserToPapers < ActiveRecord::Migration
  def change
    add_reference :papers, :user, index: true
    add_foreign_key :papers, :users
  end
end
