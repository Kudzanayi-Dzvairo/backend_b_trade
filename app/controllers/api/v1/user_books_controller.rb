class Api::V1::UserBooksController < ApplicationController
	skip_before_action :authorized, only: [:create]

=begin
1. creste book Record
2. create user book record
`/api/v1/user_book` POST
{
  "user_id": int,
	"shelf": int
	"book": {
		"title": str
		"author": str
		"description": str
		"page_count": int
		"image" str - url
  }
}
=end

  #POST /user_book
	def create
		puts "HI"
		puts params
		@book = Book.create(book_params)
		ub_params = user_book_params

		@user_book = UserBook.create(
			user_id: ub_params[:user_id],
			shelf: ub_params[:shelf],
			book_id: @book.id,
			currently_reading: false #TODO default currently_reading to false
		)

		render json: {
			book: @book,
			user_book: @user_book
		}
	end

	private

	def book_params
		puts "book params"
		puts params 
		params.require(:book).permit(:title, :author, :description, :page_count, :image)
	end

	def user_book_params
		params.require(:user_book).permit(:user_id, :shelf)
	end





end
