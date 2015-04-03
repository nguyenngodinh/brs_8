class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :isbn
      t.string  :title
      t.integer :edition
      t.date    :publish_date
      t.string  :author
      t.integer :number_of_pages

      t.timestamps null: false
    end
  end
end
