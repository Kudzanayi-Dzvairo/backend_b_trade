class UserBook < ApplicationRecord
	enum shelf: [:library, :trades, :wishlist]
	belongs_to :user
	belongs_to :book
end
