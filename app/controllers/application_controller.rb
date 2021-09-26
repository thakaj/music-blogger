class ApplicationController < ActionController::API
    include ActionController::Cookies
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    
    private 

        def render_unprocessable_entity
            render json: {errors: "Please enter data into both forms" }, status: :unprocessable_entity
        end

end
