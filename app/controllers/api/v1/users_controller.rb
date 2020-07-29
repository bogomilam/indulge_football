class Api::V1::UsersController < ApplicationController
    #V @ 23.47 because of POST http://localhost:3000/api/v1/users 500 (Internal Server Error)

    def create
        user = User.new(user_params)

        if user.save
            render json: user
        else
            render errors: user.errors.full_messages, status: :unauthorized
        end

        private 

        def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
        end
    end


end
