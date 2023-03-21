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
        camper = create_camper
        if camper.save
            render json: camper, status: :created
        else
            render json: { errors: camper.errors.full_messages }, status: :unprocessable_entity
        end
    end


    private

    def find_campers
        Camper.find_by(id: params[:id])
    end

    def create_camper
        Camper.create(camper_params)
    end

    def camper_params
        params.permit(:name, :age)
    end

    def error_message
        render json: { error: "Camper not found"}, status: :not_found
    end

end
