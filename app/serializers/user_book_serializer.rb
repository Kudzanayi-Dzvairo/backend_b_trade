class UserBookSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :book_id, :shelf, :currently_reading
end
