class Api::V1::AuthController < ApplicationController
	skip_before_action :authorized, only: [:create]

	def create
		@user = User.find_by(username: user_login_params[:username])

		if @user && @user.authenticate(user_login_params[:password])

			token = encode_token({ user_id: @user.id })

			render json: {user: @user.id, jwt: token}, status: :accepted
		else
			render json: {message: 'Invalid username or password'}, status: :unauthorized
		end
	end


	def show
		@user = current_user
      if @user
        render json: { user: UserSerializer.new(@user) }
      else
        render json: { error: 'must log in' }, status: :unauthorized
      end
    end

	private

	def user_login_params
		params.require(:user).permit(:username, :password)
	end
end