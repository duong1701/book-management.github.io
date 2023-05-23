json.extract! borrower, :id, :name, :phone, :description, :address, :gender, :created_at, :updated_at
json.url borrower_url(borrower, format: :json)
