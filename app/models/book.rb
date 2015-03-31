class Book < ActiveRecord::Base
  validates :category_id, presence: true
  belongs_to :category

  scope :categories, -> category_id {where category_id: category_id}

  def self.search_by_title query_title
    if query_title
      where "title LIKE ?", "%#{query_title}%"
    else
      Book.all
    end
  end

end
