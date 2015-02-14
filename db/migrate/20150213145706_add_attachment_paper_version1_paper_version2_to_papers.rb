class AddAttachmentPaperVersion1PaperVersion2ToPapers < ActiveRecord::Migration
  def self.up
    change_table :papers do |t|
      t.attachment :paper_version1
      t.attachment :paper_version2
    end
  end

  def self.down
    remove_attachment :papers, :paper_version1
    remove_attachment :papers, :paper_version2
  end
end
