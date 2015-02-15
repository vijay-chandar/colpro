class PaymentDetail < ActiveRecord::Base
	acts_as_xlsx
	belongs_to :user
	has_attached_file :dd_copy
  	validates_attachment_content_type :dd_copy, :content_type => /\Aimage\/.*\Z/	
  	validates_uniqueness_of :user_id
end

