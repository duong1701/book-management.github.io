require "test_helper"

class BookBorrowersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book_borrower = book_borrowers(:one)
  end

  test "should get index" do
    get book_borrowers_url
    assert_response :success
  end

  test "should get new" do
    get new_book_borrower_url
    assert_response :success
  end

  test "should create book_borrower" do
    assert_difference("BookBorrower.count") do
      post book_borrowers_url, params: { book_borrower: { book_id: @book_borrower.book_id, borrowDate: @book_borrower.borrowDate, borrower_id: @book_borrower.borrower_id, description: @book_borrower.description, returnDate: @book_borrower.returnDate } }
    end

    assert_redirected_to book_borrower_url(BookBorrower.last)
  end

  test "should show book_borrower" do
    get book_borrower_url(@book_borrower)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_borrower_url(@book_borrower)
    assert_response :success
  end

  test "should update book_borrower" do
    patch book_borrower_url(@book_borrower), params: { book_borrower: { book_id: @book_borrower.book_id, borrowDate: @book_borrower.borrowDate, borrower_id: @book_borrower.borrower_id, description: @book_borrower.description, returnDate: @book_borrower.returnDate } }
    assert_redirected_to book_borrower_url(@book_borrower)
  end

  test "should destroy book_borrower" do
    assert_difference("BookBorrower.count", -1) do
      delete book_borrower_url(@book_borrower)
    end

    assert_redirected_to book_borrowers_url
  end
end
