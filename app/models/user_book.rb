class UserBook < ApplicationRecord
	enum status: [:shelf, :trades, :wishlist]
	belongs_to :user
	belongs_to :book
end
