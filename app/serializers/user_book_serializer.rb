class UserBookSerializer < ActiveModel::Serializer
  attributes :id, :shelf, :currently_reading, :title, :author
  belongs_to :user
	belongs_to :book
  def title
    object.book.title
  end

  def author
    object.book.author
  end
end
