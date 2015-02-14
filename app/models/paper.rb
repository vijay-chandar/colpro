class Paper < ActiveRecord::Base
	has_attached_file :paper_version1
	has_attached_file :paper_version2
	do_not_validate_attachment_file_type :paper_version1
	do_not_validate_attachment_file_type :paper_version2
	enum type_of_conference: [ "CSE & IT", "ECE & EEE", "MECH & CIVIL" ] 
end
