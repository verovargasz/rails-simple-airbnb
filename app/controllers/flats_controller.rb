class FlatsController < ApplicationController
  before_action :find_flat, only: %i[show edit update]

  def index
    @flats = Flat.all
  end

  def new
    @flat = Flat.new # needed to instantiate the form_for
  end

  def create
    @flat = Flat.new(flat_params)
    # @flat.update(flat_params) unless @flat.valid? 
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def edit; end

  def update
    @flat.update(flat_params)

    redirect_to flat_path(@flat)
  end

  def show; end

  def destroy
    find_flat
    @flat.destroy

    # no need for app/views/flats/destroy.html.erb
    redirect_to flats_path
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end

  def find_flat
    @flat = Flat.find(params[:id])
  end
end
