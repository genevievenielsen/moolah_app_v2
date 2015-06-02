  class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def venmo_pay

     # REAL

     # uri = URI(ENV['VENMO_LINK'])

     # error_array = []
     # params[:items].each do |item|

     # res = Net::HTTP.post_form(uri, access_token: current_user.venmo_access_token,
     #                                email: item[1]['email'],
     #                                actor_id: item[1]['actor'],
     #                                note: item[1]['note'],
     #                                target: item[1]['target'],
     #                                amount: item[1]['amount'],
     #                                audience: 'private')
     #   puts res.body

    # SANDBOX
      uri = URI('https://sandbox-api.venmo.com/v1/payments')

      error_array = []
      params[:items].each do |item|

        res = Net::HTTP.post_form(uri, access_token: current_user.venmo_access_token,
                                     user_id: '145434160922624933',
                                     note: item[1]['note'],
                                     target: item[1]['target'],
                                     amount: item[1]['amount'],
                                     audience: 'private')

      # puts res.body
        if res.body.include?"error"
           @error_message = res.body
           @error_message = @error_message.split("message\": ")
           @message = @error_message[1]
           @message = @message.split(",")
           @explanation = @message[0]
           # Note
           # This is res.body when there is an error
           # {"error": {"message": "The amount specified is not a sandbox test amount", "code": 503}}
            error_array.push(@explanation.strip)
        else
          # Changes order status to paid
          @cart = Cart.find_by(user_id: current_user.id)
          @selected_item = @cart.selected_items.find_by(:item_id => item[1]['id'].to_i)
          @selected_item.paid = true
          @selected_item.save
          Notifier.payment_confirmation(current_user, item[1]['note'], item[1]['amount']).deliver
        end
      end

      if error_array.present? && error_array.length > 0
       redirect_to :back, notice: "An error occured in your venmo payment - #{error_array.each do |error|
        error
       end}"
      else
        redirect_to home_url, notice: 'You have successfully paid for your cart with Venmo!'
        @cart = Cart.find_by(user_id: current_user.id)
        @cart.paid = true
        @cart.save
      end
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
    @members_who_paid = 0
    @item.club.members.each do |member|
     if member.paid_items.include?(@item)
       @members_who_paid += 1
     else
       @outstanding_payments += 1
     end
    end

    @emails = 0
      @item.club.emails.each do |email| unless @item.club.members.pluck(:email).include?(email.email)
        @emails += 1
      end
    end

    @total_outstanding = @outstanding_payments + @emails

    @number_of_purchases = SelectedItem.where(item_id: @item.id, paid: true).count
    @amount_raised = @number_of_purchases * @item.price

  end

  def mark_paid
    @item = Item.find(params[:item_id])
    @user = User.find(params[:user_id])

    @selected_item = SelectedItem.new
    @selected_item.item_id = @item.id
    @selected_item.user_id = @user.id
    @selected_item.paid = true
    @selected_item.save

    @cart = Cart.find_or_create_by(:id => @selected_item.cart_id)
    @cart.paid = true
    @cart.user = @user
    @cart.save

    @selected_item.cart_id = @cart.id
    @selected_item.save

    redirect_to :back, :notice => "Marked as paid!"
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

    @selected_item = SelectedItem.find_by(:user_id => current_user.id, :item_id => @item.id.to_s )

  end

  # GET /items/new
  def new
    @item = Item.new

  end

  # GET /items/1/edit
  def edit

     @colors = ""
     @item.color_options.each do |color|
       @colors = @colors + color.color + " "
     end

     @sizes = ""
     @item.size_options.each do |size|
       @sizes = @sizes + size.size + " "
     end

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

    # create a new color unless it already exists
    if params[:colors].present?
      color_options = params[:colors]
      colors = color_options.split(" ")
      colors.each do |color|
        @color_option = @item.color_options.create(color: color) unless ColorOption.where(:item_id => @item.id.to_s).pluck(:color).include?(color)
      end
    end

    # if a color option is not present in the params destroy it
    if params[:colors].present?
      color_options = params[:colors].to_s
      ColorOption.where(:item_id => @item.id.to_s).each do |color_option|
        if color_options.include?(color_option.color)
        else
          color_option.destroy
        end
      end
    end


    # Create a new size unless it already exists
    if params[:sizes].present?
      size_options = params[:sizes]
      sizes = size_options.split(" ")
      sizes.each do |size|
        @size_option = @item.size_options.create(size: size) unless SizeOption.where(:item_id => @item.id.to_s).pluck(:size).include?(size)
      end
    end

    # if a size option is not present in the params destroy it
    if params[:sizes].present?
      size_options = params[:sizes].to_s
      SizeOption.where(:item_id => @item.id.to_s).each do |size_option|
        if size_options.include?(size_option.size)
        else
          size_option.destroy
        end
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
      format.html { redirect_to root_url, notice: 'Item was successfully deleted.' }
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
