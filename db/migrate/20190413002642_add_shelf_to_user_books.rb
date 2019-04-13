class AddShelfToUserBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :user_books, :shelf, :integer
  end
end
