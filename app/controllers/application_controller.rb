class ApplicationController < ActionController::API
    include ActionController::Cookies
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    private 

        def authorize
             @logged_in_user = User.find_by(id: session[:user_id])

             render json: {errors: "Not Authorized"}, status: :unauthorized unless @logged_in_user
        end

        def render_not_found(exception)
         render json: {messages: exception.message}, status: :not_found
        end

        def render_unprocessable_entity(exception)
            render json: {errors: exception.record.errors.full_messages }, status: :unprocessable_entity
        end

end
