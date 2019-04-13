class UserBook < ApplicationRecord
	enum status: [:shelf, :trades, :wishlist]
end
