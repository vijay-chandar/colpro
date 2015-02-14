json.array!(@papers) do |paper|
  json.extract! paper, :id, :type_of_conference, :paper_title, :abstract
  json.url paper_url(paper, format: :json)
end
