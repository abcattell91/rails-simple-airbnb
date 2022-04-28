# frozen_string_literal: true

class FlatsController < ApplicationController
  # frozen_string_literal: true
  before_action :find_flat, only: %i[show edit update destroy]

  def index
    @flats = Flat.all
  end

  def show; end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def edit; end

  def update
    @flat.update(flat_params)

    redirect_to flat_path
  end

  def destroy
    @flat.destroy

    redirect_to flats_path
  end

  def search
    if @flats = Flat.all
      @flats_found = Flat.where(name: params[:query])
      @query = params[:query]
    else
      params[:query] == ''
      redirect_to flats_path
    end
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests, :picture_url)
  end

  def find_flat
    @flat = Flat.find(params[:id])
  end
end
