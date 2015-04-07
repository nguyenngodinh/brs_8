include BooksHelper

ActiveAdmin.register Book do
  permit_params :isbn, :title, :edition, :author, :cover,
                :category_id, :publish_date, :number_of_pages

  config.sort_order = :created_at_desc

  index do
    selectable_column
    column "ISBN", :isbn
    column :title, sortable: :title do |book|
      link_to book.title, admin_book_path(book)
    end
    column :edition
    column :author
    column :category
    column :publish_date
    actions
  end

  index as: :grid, columns: 5, default: true do |book|
    link_to image_tag(cover_url book), admin_book_path(book)
  end

  sidebar :order, priority: 0 do
    text_node "Request for new book? "
    link_to "Order in this page.", "#"
  end

  sidebar :help, only: :index do
    "Need help? Email us at help@example.com"
  end
end
