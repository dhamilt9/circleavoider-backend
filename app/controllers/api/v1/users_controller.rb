class Api::V1::UsersController < ApplicationController
	def create
		@user = User.new(
			username: params[:username],
			password: params[:password]
		)
		if @user.save
			token = encode_token(@user.id)
			render json: {user: UserSerializer.new(@user), token: token}
		else
			render json: {errors: @user.errors.full_messages}
		end
	end

	def show
		if curr_user
			render json: curr_user
		else
			render json: {errors: "Error logging in"}
		end
	end

	def index
		render json: User.all
	end
end
