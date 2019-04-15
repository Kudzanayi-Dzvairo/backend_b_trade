class ChangeColumnDefaultDefaultValueToCurrentlyReading < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:user_books, :currently_reading, 'false')
  end
end
