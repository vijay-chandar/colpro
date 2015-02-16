class PaymentDetail < ActiveRecord::Base
	acts_as_xlsx
	belongs_to :user
	has_attached_file :dd_copy,
	:storage => :dropbox,
	:dropbox_credentials => Rails.root.join("config/dropbox.yml"),
	:dropbox_visibility => 'public'
  	validates_attachment_content_type :dd_copy, :content_type => /\Aimage\/.*\Z/, :size => { :in => 0..1000.kilobytes }	
  	validates_uniqueness_of :user_id
end