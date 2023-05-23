class BookBorrowersController < ApplicationController
  before_action :authenticate, only: [:create, :update, :destroy] # trước khi action thì controller sẽ check xem admin đã đang nhập vào hay chưa
  before_action :set_book_borrower, only: %i[ show edit update destroy ]
  before_action :check_return_date, only: [:index, :show] # trước khi action thì controller sẽ check xem là ngày trả sách của đã tới ngày hôm nay chưa => nếu rồi thì hoàn trả lại số lương + set isAvailable 

  # GET /book_borrowers or /book_borrowers.json
  def index
    @book_borrowers = BookBorrower.all
  end

  # GET /book_borrowers/1 or /book_borrowers/1.json
  def show
  end

  # GET /book_borrowers/new
  def new
    @book_borrower = BookBorrower.new
  end

  # GET /book_borrowers/1/edit
  def edit
  end

  # POST /book_borrowers or /book_borrowers.json
  def create
    @book_borrower = BookBorrower.new(book_borrower_params)

    respond_to do |format|
      if @book_borrower.save
        book = @book_borrower.book #
        if book.quantity > 0
          book.quantity -= 1
          book.save
          book.update(isAvailable: book.quantity > 0) # sau khi tạo mới mượn sách => số sách sẽ -1
        else
          book.update(isAvailable: false) # nếu số sách =0 => isAvailable = false
        end
        format.html { redirect_to book_borrower_url(@book_borrower), notice: "Book borrower was successfully created." }
        format.json { render :show, status: :created, location: @book_borrower }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book_borrower.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_borrowers/1 or /book_borrowers/1.json
  def update
    respond_to do |format|
      if @book_borrower.update(book_borrower_params)
        format.html { redirect_to book_borrower_url(@book_borrower), notice: "Book borrower was successfully updated." }
        format.json { render :show, status: :ok, location: @book_borrower }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book_borrower.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_borrowers/1 or /book_borrowers/1.json
  def destroy
    @book_borrower.destroy

    respond_to do |format|
      format.html { redirect_to book_borrowers_url, notice: "Book borrower was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def authenticate
      unless logged_in?
        redirect_to user_session_path, notice: 'Please log in' # nếu chưa đang nhập => in ra 'Please log in'
      end
    end

    def logged_in?
      user_signed_in? # check xem admin đã đăng nhập vào hay chưa
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_book_borrower
      @book_borrower = BookBorrower.find(params[:id])
    end

    def check_return_date
      BookBorrower.all.each do |book_borrower|
        if book_borrower.returnDate.present? && book_borrower.returnDate <= Date.today
          book = book_borrower.book
          book.quantity += 1
          book.save
          book.update(isAvailable: true) # Assuming isAvailable should be set to true when book is returned
        end
      end
    end

    # Only allow a list of trusted parameters through.
    def book_borrower_params
      params.require(:book_borrower).permit(:borrowDate, :returnDate, :description, :book_id, :borrower_id)
    end
end
