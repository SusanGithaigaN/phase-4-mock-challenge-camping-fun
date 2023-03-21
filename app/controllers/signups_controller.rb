class SignupsController < ApplicationController
    def create
        signup = create_signup
        if signup.save
            render json: signup, include: :activity, status: :created
            else
                render json: { errors: signup.errors.full_messages }, status: :unprocessable_entity
            end
    end 

    private

    def create_signup
        Signup.create(signup_params)
    end

    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end
end
