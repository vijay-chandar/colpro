class AddUserNumberToPaymentDetail < ActiveRecord::Migration
  def change
    add_column :payment_details, :user_number, :string
  end
end
