class CreatePaymentDetails < ActiveRecord::Migration
  def change
    create_table :payment_details do |t|
      t.integer :amount
      t.string :dd_number
      t.string :bank
      t.string :branch

      t.timestamps null: false
    end
  end
end
