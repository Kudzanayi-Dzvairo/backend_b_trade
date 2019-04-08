class Api::V1::UsersController < ApplicationController
	skip_before_action :authorized, only: [:create]

	def profile
		render json: { user: UserSerializer.new(current_user) }, status: :accepted
	end

	def index
    @users = User.all
    render json: @users
  end

		def create
     @user = User.create(user_params)
     if @user.valid?
			  @token = encode_token(user_id: @user.id)
       render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
     else
       render json: { error: 'failed to create user' }, status: :not_acceptable
     end
  end

  def delete_book
    @user_book = UserBook.find_by(user_id: params[:user_id], book_id: params[:id])
    @user_book.delete
    render json: @user_book
  end

  def get_my_books
    @user = User.find(params[:id])
    render json: @user.books
  end


  private

  def user_params
  params.require(:user).permit(:username, :password)
  end


end
