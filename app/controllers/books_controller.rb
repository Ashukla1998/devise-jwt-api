class BooksController < ApplicationController
  before_action :authenticate_user!
  def create
    @book = Book.new(book_params)
    if @book.save
      render json: @book, status: :ok 
    else
      render json: {error: @book.errors}, status: :unprocessable_entity
    end
  end

  def update
    @book = Book.find_by(id: params[:id])
    if @book.present?
      @book.update(book_params)
      render json: @book, status: :ok 
    else
      render json: {error: "book not found!"}, status: :unprocessable_entity
    end
  end
  private
  def book_params
    params.require(:book).permit(:bname,:aname)
  end
end
