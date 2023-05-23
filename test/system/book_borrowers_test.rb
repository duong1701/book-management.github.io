require "application_system_test_case"

class BookBorrowersTest < ApplicationSystemTestCase
  setup do
    @book_borrower = book_borrowers(:one)
  end

  test "visiting the index" do
    visit book_borrowers_url
    assert_selector "h1", text: "Book borrowers"
  end

  test "should create book borrower" do
    visit book_borrowers_url
    click_on "New book borrower"

    fill_in "Book", with: @book_borrower.book_id
    fill_in "Borrowdate", with: @book_borrower.borrowDate
    fill_in "Borrower", with: @book_borrower.borrower_id
    fill_in "Description", with: @book_borrower.description
    fill_in "Returndate", with: @book_borrower.returnDate
    click_on "Create Book borrower"

    assert_text "Book borrower was successfully created"
    click_on "Back"
  end

  test "should update Book borrower" do
    visit book_borrower_url(@book_borrower)
    click_on "Edit this book borrower", match: :first

    fill_in "Book", with: @book_borrower.book_id
    fill_in "Borrowdate", with: @book_borrower.borrowDate
    fill_in "Borrower", with: @book_borrower.borrower_id
    fill_in "Description", with: @book_borrower.description
    fill_in "Returndate", with: @book_borrower.returnDate
    click_on "Update Book borrower"

    assert_text "Book borrower was successfully updated"
    click_on "Back"
  end

  test "should destroy Book borrower" do
    visit book_borrower_url(@book_borrower)
    click_on "Destroy this book borrower", match: :first

    assert_text "Book borrower was successfully destroyed"
  end
end
