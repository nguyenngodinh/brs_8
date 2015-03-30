class BooksController < ApplicationController
  
  def index
    @books = Book.search_by_title params[:title_query]
  end

  def show
    @book = Book.find params[:id]
  end

end
