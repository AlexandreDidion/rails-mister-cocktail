class DosesController < ApplicationController
  before_action :find_related_cocktail, only: %i[new create]

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_strong_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find_by(id: params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_strong_params
    params.require(:dose).permit(:description, :ingredient_id, :coctail_id)
  end

  def find_related_cocktail
    @cocktail = Cocktail.find_by(id: params[:cocktail_id])
  end
end
