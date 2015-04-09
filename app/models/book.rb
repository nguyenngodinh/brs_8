class Book < ActiveRecord::Base
  belongs_to :category
  has_attached_file :document, styles: {thumb: ["595x842>", :png]},
                    url:  "/uploads/:class/:attachment/:id_:style.:extension",
                    path: ":rails_root/public:url"

  validates :category_id, presence: true
  validates_attachment :document,
        presence: true,
        size: {in: 0..100.megabytes}
        # content_type: {content_type: "application/pdf"} # gem bug
  do_not_validate_attachment_file_type :document

  scope :categories, -> category_id {where category_id: category_id}

  def self.search_by_title query_title
    if query_title
      where "title LIKE ?", "%#{query_title}%"
    else
      Book.all
    end
  end
end
