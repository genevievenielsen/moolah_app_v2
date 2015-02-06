class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

   def venmo_pay

     # REAL

     #uri = URI('https://api.venmo.com/v1/payments')

     #res = Net::HTTP.post_form(uri, access_token: current_user.venmo_access_token,
                                     #email: params['email'],
                                     #actor: params['actor'],
                                     #note: params['note'],
                                     #target: params['target'],
                                     #amount: params['amount'],
                                     #audience: 'private')

    # SANDBOX
      uri = URI('https://sandbox-api.venmo.com/v1/payments')

      params[:items].each do |item|

      puts item

      res = Net::HTTP.post_form(uri, access_token: current_user.venmo_access_token,
                                     user_id: '145434160922624933',
                                     note: item[1]['note'],
                                     target: item[1]['target'],
                                     amount: '0.10',
                                     audience: 'private')

      puts res.body
      end

    # Changes order status to paid
    @cart = Cart.find_by(:user_id => current_user.id, :paid => false)
    # if settled then change to pay, but for each item
    # if one fails, have that remain in the cart and the others are removed
    @cart.paid = true
    @cart.save
    redirect_to home_url, notice: 'You have successfully paid for your cart with Venmo!'
  end

  def my_items
    @clubs = current_user.clubs
    @cart = Cart.find_or_create_by(:user_id => current_user.id, :paid => false)

    @paid_items = current_user.paid_items

    @items_for_sale = current_user.items_for_sale
  end

  def view_report
     @item = Item.find(params[:id])

     @outstanding_payments = 0
     @purchases = 0
     @item.club.members.each do |member|
      if member.paid_items.include?(@item)
        @purchases += 1
      else
        @outstanding_payments += 1
      end
     end
  end
  # GET /items
  # GET /items.json
  def index
    @items = current_user.university.items
    @cart = Cart.find_or_create_by(:user_id => current_user.id, :paid => false)

  end

  # GET /items/1
  # GET /items/1.json
  def show
      @cart = Cart.find_or_create_by(:user_id => current_user.id, :paid => false)

  end

  # GET /items/new
  def new
    @item = Item.new
    # @color_option = ColorOption.new
  end

  # GET /items/1/edit
  def edit
    # @color_option = @item.color_options
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @item.owner_id = current_user.id
    @item.university_id = current_user.university.id



    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end

    if params[:colors].present?
      color_options = params[:colors]
      colors = color_options.split(" ")
      colors.each do |color|
        @color_option = @item.color_options.create(color: color)
      end
    end

    if params[:sizes].present?
      size_options = params[:sizes]
      sizes = size_options.split(" ")
      sizes.each do |size|
        @size_option = @item.size_options.create(size: size)
      end
    end

  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update



    # if a color option is not present in the params destroy it

    if params[:colors].present?
      color_options = params[:colors]
      colors = color_options.split(" ")
      colors.each do |color|
        @color_option = @item.color_options.create(color: color) unless ColorOption.where(:item_id => @item.id).pluck(:color).include?(color)


      end
    end

    if params[:colors].present?
      color_options = params[:colors].to_s
      ColorOption.where(:item_id => @item.id).each do |color_option|
        if color_options.include?(color_option.color)
        else
          color_option.destroy
        end
      end
    end

    if params[:sizes].present?
      size_options = params[:sizes]
      sizes = size_options.split(" ")
      sizes.each do |size|
        @size_option = @item.size_options.create(size: size)
      end
    end

    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :description, :price, :required, :owner_id, :expiration_date, :club_id, :image, :category, :color, :size, :university_id, items: {})
    end
end
