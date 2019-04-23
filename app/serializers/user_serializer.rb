class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password
  has_many :user_books
	has_many :books, through: :user_books

end
