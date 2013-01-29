class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new active: true
    @categories = Category.all
  end

  def create
    @product = Product.new form_params

    if @product.valid?
      @product.save
      return redirect_to products_path, notice: "Your product #{@product.name} has been created!"
    end

   @categories = Category.all
   render :new
  end

  def show
    @product = Product.find_by_id model_id
  end

  def edit
    @product = Product.find_by_id model_id
    @categories = Category.all
  end

  def update
    @product = Product.find_by_id model_id

    if @product.update_attributes form_params
      return redirect_to products_path, notice: "Your product #{@product.name} has been updated!"
    end

    @categories = Category.all
    render :edit
  end

private
  def form_params
    params.require(:product).permit(:active, :description, :name, :price, :category_id)
  end

  def model_id
    params.permit :id
  end
end
