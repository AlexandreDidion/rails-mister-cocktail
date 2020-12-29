class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [:show]
  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
    @review = Review.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_strong_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def search
    if params[:query].present?
      sql_query = 'cocktails.name ILIKE :query OR ingredients.name ILIKE :query'
      @cocktails = Cocktail.joins(:ingredients).where(sql_query, query: "%#{params[:query]}%").uniq
    else
      @cocktails = Cocktail.all
    end
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_strong_params
    params.require(:cocktail).permit(:name)
  end
end
