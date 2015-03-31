class BooksController < ApplicationController
  
  def index
    @books = Book.search_by_title params[:title_query]
    if params.has_key?(:category_query) && params[:category_query].to_s != "all"
      @books = @books.categories params[:category_query]
    end
  end

  def show
    @book = Book.find params[:id]
  end

end
