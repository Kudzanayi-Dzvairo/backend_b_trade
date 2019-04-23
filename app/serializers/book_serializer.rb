class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :description, :page_count
  has_many :user_books
  has_many :user, through: :user_books
end
