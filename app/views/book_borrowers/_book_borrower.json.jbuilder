json.extract! book_borrower, :id, :borrowDate, :returnDate, :description, :book_id, :borrower_id, :created_at, :updated_at
json.url book_borrower_url(book_borrower, format: :json)
