class ActivitiesController < ApplicationController
    def index
        activities = Activity.all
        render json: activities
    end
    
    def destroy
        activity = find_activity
        if activity
            activity.destroy
            head :no_content
        else
            activity_errors
        end
    end

    private

    def find_activity
        Activity.find_by(id: params[:id])
    end

    def activity_errors
        render json: { error: "Activity not found" }, status: :not_found
    end
end
