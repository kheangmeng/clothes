class ColorsController < ApplicationController
  before_action :set_color, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /colors
  # GET /colors.json
  def index
    @colors = Color.all
  end

  # GET /colors/new
  def new
    @color = Color.new
  end

  # GET /colors/1/edit
  def edit
  end

  # POST /colors
  # POST /colors.json
  def create
    if current_user.admin === true
      @color = Color.new(color_params)

      respond_to do |format|
        if @color.save
          format.html { redirect_to colors_path, notice: 'Color was successfully created.' }
          format.json { render :show, status: :created, location: @color }
        else
          format.html { render :new }
          format.json { render json: @color.errors, status: :unprocessable_entity }
        end
      end
    else
      format.html { render :new }
      format.json { render json: @category.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /colors/1
  # PATCH/PUT /colors/1.json
  def update
    if current_user.admin === true 
      respond_to do |format|
        if @color.update(color_params)
          format.html { redirect_to colors_path, notice: 'Color was successfully updated.' }
          format.json { render :show, status: :ok, location: @color }
        else
          format.html { render :edit }
          format.json { render json: @color.errors, status: :unprocessable_entity }
        end
      end
    else
      format.html { render :edit }
      format.json { render json: @category.errors, status: :unprocessable_entity }
    end
  end

  # DELETE /colors/1
  # DELETE /colors/1.json
  # def destroy
  #   @color.destroy
  #   respond_to do |format|
  #     format.html { redirect_to colors_url, notice: 'Color was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_color
      @color = Color.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def color_params
      params.require(:color).permit(:name)
    end
end
