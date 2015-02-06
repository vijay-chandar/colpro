json.array!(@registrations) do |registration|
  json.extract! registration, :id, :first_name, :last_name, :college_name, :department, :email, :mobile_number, :type_of_conference, :paper_title, :abstract, :file_upload
  json.url registration_url(registration, format: :json)
end
