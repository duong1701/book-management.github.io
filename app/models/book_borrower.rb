class BookBorrower < ApplicationRecord
  belongs_to :book
  belongs_to :borrower
  validates_presence_of :returnDate, :borrowDate
end
