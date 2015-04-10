class CreateBookRequests < ActiveRecord::Migration
  def change
    create_table :book_requests do |t|
      t.integer :isbn
      t.text :description
      t.integer :state, default: 0
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :book_requests, :users
    add_index :book_requests, [:user_id, :created_at]
  end
end
