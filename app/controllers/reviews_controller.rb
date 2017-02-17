class ReviewsController < ApplicationController
before_filter :authorize


  def create
    values = params[:review]
    review = Review.new do |comment|
      comment.user = current_user
      comment.product_id = params[:product_id]
      comment.description = values[:description]
      comment.rating = values[:rating]
  end

  if review.save
      redirect_to "/products/#{params[:product_id]}"
    else
      redirect_to "/products/#{params[:product_id]}"
    end
  end

  def destroy
    @reviewd = Review.find params[:id]
    @reviewd.destroy
    redirect_to "/products/#{params[:product_id]}", notice: 'Review deleted'
  end

end
