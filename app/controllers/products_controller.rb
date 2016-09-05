class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
 # before_action :set_values, only: [:new, :edit]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /products
  # GET /products.json
  def index
    @search = Product.search(params[:q])
    @products = @search.result
    @brands = Brand.all
  end

  def adminPage
    @search = Product.search(params[:q])
    @products = @search.result
  end

  def customerPage
    
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @brands = Brand.all
  end

  # GET /products/new
  def new
    if current_user.admin === true
      @product = Product.new
    else
      redirect_to products_path, notice: 'Not allow to Add product.'  
    end 
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    if current_user.admin === true
      @product = Product.new(product_params)
      @product.user_id = current_user.id

      if @product.price > @product.discount
        respond_to do |format|
          if @product.save
            format.html { redirect_to @product, notice: 'Product was successfully created.' }
            format.json { render :show, status: :created, location: @product }
          else
            format.html { render :new }
            format.json { render json: @product.errors, status: :unprocessable_entity }
          end
        end
      else
        redirect_to new_product_path, notice: 'discount field must be less than price field.' 
      end
      
    else
      redirect_to products_path, notice: 'Not allow to ADD product.'  
    end  
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    if current_user.admin === true
      respond_to do |format|
        if @product.update(product_params)
          format.html { redirect_to @product, notice: 'Product was successfully updated.' }
          format.json { render :show, status: :ok, location: @product }
        else
          format.html { render :edit }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to products_path, notice: 'Not allow to UPDATE product.'  
    end  
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    if current_user.admin === true
      @product.destroy
      respond_to do |format|
        format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to products_path, notice: 'Not allow to DELETE product.'    
    end  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def set_values
      @categories = Category.all
      @colors = Color.all
      @brands = Brand.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:codename, :quentity, :size, :price, :discount, :Category_id,
       :Brand_id, :Color_id, images: [])
    end
end
