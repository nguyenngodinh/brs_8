module BooksHelper
  def cover_url(book)
    book.cover || 'missing_book_cover.svg'
  end
end
