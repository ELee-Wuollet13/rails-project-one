class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "You've successfully signed up!"
      session[:product_id] = @product.id
      redirect_to new_question_path
    else
      flash[:alert] = "There was a problem signing up."
      redirect_to signup_path
    end
  end

  private

  def product_params
    params.require(:product).permit(:cost, :reviews, :reviews, :country_of_origin)
  end
end
