class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # has_attached_file :paper_version1,:paper_version2
  # do_not_validate_attachment_file_type :paper_version1,:paper_version2
  enum designation: [ "PG Student", "Faculty Member", "Delegates" ]
  has_many :papers
  has_one :payment_detail
end
