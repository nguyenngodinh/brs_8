class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer    :isbn
      t.string     :title
      t.integer    :edition
      t.string     :author
      t.string     :cover
      t.references :category,       index: true
      t.date       :publish_date
      t.integer    :number_of_pages

      t.timestamps null: false
    end
    add_foreign_key :books, :categories
  end
end
