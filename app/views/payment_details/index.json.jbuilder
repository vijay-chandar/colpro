json.array!(@payment_details) do |payment_detail|
  json.extract! payment_detail, :id, :amount, :dd_number, :bank, :branch
  json.url payment_detail_url(payment_detail, format: :json)
end
