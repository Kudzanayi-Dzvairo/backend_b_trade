class RemoveShelfFromUserBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_books, :shelf, :string
  end
end
