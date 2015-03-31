class Book < ActiveRecord::Base
  
  def self.search_by_title(query_title)
    if query_title
      where("title LIKE ?", "%#{query_title}%")
    else
      Book.all
    end
  end

end
