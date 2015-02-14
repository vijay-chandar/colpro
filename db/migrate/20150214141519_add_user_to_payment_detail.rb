class AddUserToPaymentDetail < ActiveRecord::Migration
  def change
    add_reference :payment_details, :user, index: true
    add_foreign_key :payment_details, :users
  end
end
