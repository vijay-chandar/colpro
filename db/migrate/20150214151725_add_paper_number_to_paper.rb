class AddPaperNumberToPaper < ActiveRecord::Migration
  def change
    add_column :papers, :paper_number, :string
  end
end
