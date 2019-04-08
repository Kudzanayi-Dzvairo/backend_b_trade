class Api::V1::BooksController < ApplicationController

	def index
	 @books = Book.all
	 render json: @books
 end

 def create
	 @book = Book.find_or_create_by(book_params)
	 @user = User.find(params[:user_id])
	 @user.books << @book
	 render json: @book
 end

 private

 def book_params
	 params.permit(:title, :author, :description, :page_count)
 end
end
