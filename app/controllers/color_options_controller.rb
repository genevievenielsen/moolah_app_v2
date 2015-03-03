class ColorOptionsController < ApplicationController
  before_action :set_color_option, only: [:show, :edit, :update, :destroy]

  # GET /color_options
  # GET /color_options.json
  def index
    @color_options = ColorOption.all
  end

  # GET /color_options/1
  # GET /color_options/1.json
  def show
  end

  # GET /color_options/new
  def new
    @color_option = ColorOption.new
  end

  # GET /color_options/1/edit
  def edit
  end

  # POST /color_options
  # POST /color_options.json
  def create
    @color_option = ColorOption.new(color_option_params)

    respond_to do |format|
      if @color_option.save
        format.html { redirect_to @color_option, notice: 'Color option was successfully created.' }
        format.json { render :show, status: :created, location: @color_option }
      else
        format.html { render :new }
        format.json { render json: @color_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /color_options/1
  # PATCH/PUT /color_options/1.json
  def update
    respond_to do |format|
      if @color_option.update(color_option_params)
        format.html { redirect_to @color_option, notice: 'Color option was successfully updated.' }
        format.json { render :show, status: :ok, location: @color_option }
      else
        format.html { render :edit }
        format.json { render json: @color_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /color_options/1
  # DELETE /color_options/1.json
  def destroy
    @color_option.destroy
    respond_to do |format|
      format.html { redirect_to color_options_url, notice: 'Color option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_color_option
      @color_option = ColorOption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def color_option_params
      params.require(:color_option).permit(:color, :item_id)
    end
end
