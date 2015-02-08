class Registration < ActiveRecord::Base
	has_attached_file :file_upload, 
		:storage => :dropbox, 
		:dropbox_credentials => Rails.root.join("config/dropbox.yml"), 
		:dropbox_visibility => 'public'
	# do_not_validate_attachment_file_type :file_upload
	# validates_attachment :file_upload, content_type: ["application/pdf","application/docx","application/doc","application/odt"]
	validates_attachment :file_upload,  :presence => true, content_type: { content_type: ["application/pdf", "application/docx", "application/doc", "application/odt"] }
	enum department: [ :CSE, :ECE, :EEE, :IT, :MECH, :CIVIL, :Others ]
	enum type_of_conference: [ "CSE & IT", "ECE & EEE", "MECH & CIVIL" ] 
	validates :first_name, :last_name, :email, :college_name, :department, :paper_title, :abstract, presence: true
end
