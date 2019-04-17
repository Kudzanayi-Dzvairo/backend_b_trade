class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :description, :page_count
end
