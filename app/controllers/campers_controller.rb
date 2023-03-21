class CampersController < ApplicationController
    def index
        campers = Camper.all
        render json: campers
    end

    def show
        camper = find_campers
        if camper.nil?
            error_message
        else
            render json: camper, include: :activities
        end
    end

    def create
        camper = Camper.create(camper_params)
        render json: camper, status: :created
    end


    private

    def find_campers
        Camper.find_by(id: params[:id])
    end

    def error_message
        render json: { error: "Camper not found"}, status: :unprocessable_entity
    end

    def camper_params
        params.permit(:name, :age)
    end
end
