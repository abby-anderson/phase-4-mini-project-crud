class SpicesController < ApplicationController

    # GET /spices: return an array of all spices
    def index
        render json: Spice.all
    end

    # POST /spices: create a new spice
    def create
        render json: Spice.create(spice_params), status: :created
    end

    # PATCH /spices/:id: update an existing spice
    def update
        spice = Spice.find_by(id: params[:id])
        spice.update(spice_params)
        render json: spice
    end

    # DELETE /spices/:id: delete an existing spice
    def destroy
        spice = Spice.find_by(id: params[:id])
        spice.destroy
        head :no_content

    end

    private

    # strong params
    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

end
