class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  def my_cart
    @selected_items = SelectedItem.where(:user_id => current_user.id, :paid => nil)
    @items = current_user.items_in_cart
    @cart = Cart.find_or_create_by(:user_id => current_user.id, :paid => false)

    
    # This gets the venmo access token
    current_user.venmo_auth_token = params[:code].to_s
    current_user.save

    cookies[:venmo_access_token] = {
      value: params[:code].to_s,
      expires: 30.minutes.from_now
    }

    @response = HTTParty.post("https://api.venmo.com/v1/oauth/access_token",
    :query => {:client_id => ENV['VENMO_CLIENT_ID'], :client_secret => ENV['VENMO_CLIENT_SECRET'],
    :code => "#{current_user.venmo_auth_token}"})

    if @response.present? == {"error"=>{"message"=>"That Access Code has already been redeemed for an access token.", "code"=>257}}
    else
      current_user.venmo_access_token = @response["access_token"]
      #current_user.venmo_email_address = @response["user"]["email"]
      current_user.save
    end
    
  end

  def purchase_items
    @cart = Cart.find_by(:user_id => current_user.id, :paid => false)
    @cart.paid = true
    @cart.save
    redirect_to :back, notice: 'You have successfully purchased your cart!'

  end

  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:paid, :user_id)
    end
end
