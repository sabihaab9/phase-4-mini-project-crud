class SpicesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, 
    with: :render_not_found_response

    # "READ" 
    # `GET /spices`: return an array of all spices
    def index
        spices = find_spices
        render json: spices
    end


    private 

    def find_spice
        Spice.find(params[:id])
    end

    def spice_params
        params.permit(:name, :species, :likes)
    end

    def render_not_found_response
        render json: {error: "Spice not found"},
    status: :render_not_found
    end
    
end
