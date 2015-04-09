class BooksController < ApplicationController
  respond_to :html, :xml, :json

  def index
    @books = Book.search_by_title params[:title_query]
    if params.has_key?(:category_query) && params[:category_query].to_s != "all"
      @books = @books.categories params[:category_query]
    end
  end

  def show
    @book = Book.find params[:id]
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new book_params
    @book.document = params[:book][:document]
    flash[:notice] = 'Upload new book successfully.' if @book.save
    respond_with @book
  end

  private
  def book_params
    params.require(:book).permit :isbn, :title, :edition, :author, :category_id
  end
end
