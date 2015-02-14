class PaymentDetail < ActiveRecord::Base
	belongs_to :user
	has_attached_file :dd_copy
	do_not_validate_attachment_file_type :dd_copy	
end

