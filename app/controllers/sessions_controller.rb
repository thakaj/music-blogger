class SessionsController < ApplicationController

    #post/login
    def create
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
            render json: {message: "Login sucessful", user}, status: 200
        else
            render json: {error: "Invalid username or password."}, status: :unprocessable_entity
        end
    end

    #delete/logout
    def destroy
        session.destroy
        render json: {message: "You've been logged out"}, status: 200
    end

end
