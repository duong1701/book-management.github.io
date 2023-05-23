class CreateBookBorrowers < ActiveRecord::Migration[7.0]
  def change
    create_table :book_borrowers do |t|
      t.date :borrowDate
      t.date :returnDate
      t.string :description
      t.references :book, null: false, foreign_key: true
      t.references :borrower, null: false, foreign_key: true

      t.timestamps
    end
  end
end
