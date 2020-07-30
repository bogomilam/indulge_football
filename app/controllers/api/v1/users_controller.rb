class Api::V1::UsersController < ApplicationController
    #V @ 23.47 because of POST http://localhost:3000/api/v1/users 500 (Internal Server Error)
    skip_before_action :verify_authenticity_token
    
    def create
        user = User.new(user_params)

        if user.save
            render json: user
        else
            render json: {errors: user.errors.full_messages}, status: :not_acceptable
        end
    end

        private 

        def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
        end

end
