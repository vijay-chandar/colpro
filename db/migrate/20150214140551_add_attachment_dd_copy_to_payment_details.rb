class AddAttachmentDdCopyToPaymentDetails < ActiveRecord::Migration
  def self.up
    change_table :payment_details do |t|
      t.attachment :dd_copy
    end
  end

  def self.down
    remove_attachment :payment_details, :dd_copy
  end
end
