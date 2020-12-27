class ReviewsController < ApplicationController
  before_action :find_related_cocktail, only: %i[new create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_strong_params)
    @review.cocktail = @cocktail
    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find_by(id: params[:id])
    @review.destroy
    redirect_to cocktail_path(@review.cocktail)
  end

  private

  def review_strong_params
    params.require(:review).permit(:content, :rating)
  end

  def find_related_cocktail
    @cocktail = Cocktail.find_by(id: params[:cocktail_id])
  end
end
