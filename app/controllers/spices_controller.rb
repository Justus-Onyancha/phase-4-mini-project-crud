class SpicesController < ApplicationController

    # GET /spices
    def index
        spices = Spice.all
        render json: spices
    end

    # POST /spices
    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    # GET /spice/:id
    def show
        spice = find_by
        render json: spice
    end

    # PATCH /spice/:id
    def update
        spice = find_by
        spice.update(spice_params)
        render json: spice
    end

    # DELETE
    def destroy
        spice = find_by
        spice.destroy
        head :no_content
    end



    # private def
    private
    
    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def find_by
        Spice.find_by(id:params[:id])
    end
end
