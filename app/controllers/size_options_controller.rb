class SizeOptionsController < ApplicationController
  before_action :set_size_option, only: [:show, :edit, :update, :destroy]

  # GET /size_options
  # GET /size_options.json
  def index
    @size_options = SizeOption.all
  end

  # GET /size_options/1
  # GET /size_options/1.json
  def show
  end

  # GET /size_options/new
  def new
    @size_option = SizeOption.new
  end

  # GET /size_options/1/edit
  def edit
  end

  # POST /size_options
  # POST /size_options.json
  def create
    @size_option = SizeOption.new(size_option_params)

    respond_to do |format|
      if @size_option.save
        format.html { redirect_to @size_option, notice: 'Size option was successfully created.' }
        format.json { render :show, status: :created, location: @size_option }
      else
        format.html { render :new }
        format.json { render json: @size_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /size_options/1
  # PATCH/PUT /size_options/1.json
  def update
    respond_to do |format|
      if @size_option.update(size_option_params)
        format.html { redirect_to @size_option, notice: 'Size option was successfully updated.' }
        format.json { render :show, status: :ok, location: @size_option }
      else
        format.html { render :edit }
        format.json { render json: @size_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /size_options/1
  # DELETE /size_options/1.json
  def destroy
    @size_option.destroy
    respond_to do |format|
      format.html { redirect_to size_options_url, notice: 'Size option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_size_option
      @size_option = SizeOption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def size_option_params
      params.require(:size_option).permit(:size, :item_id)
    end
end
