class ClubsController < ApplicationController
  before_action :set_club, only: [:show, :edit, :update, :destroy, :leadership]

  def my_clubs
    @clubs = current_user.clubs
  end

  def leadership
   @club_leader = ClubLeader.new

   @club_leaders = @club.club_leaders
  end
  # GET /clubs
  # GET /clubs.json
  def index
    @clubs = current_user.university.clubs
  end

  # GET /clubs/1
  # GET /clubs/1.json
  def show
    @items = @club.items
    @cart = Cart.find_or_create_by(:user_id => current_user.id, :paid => false)
  end

  # GET /clubs/new
  def new
    @club = Club.new
  end

  # GET /clubs/1/edit
  def edit
  end

  # POST /clubs
  # POST /clubs.json
  def create
    @club = Club.new(club_params)
    @club.owner_id = current_user.id

    @membership = Membership.new
    @membership.club = @club
    @membership.user = current_user
    @membership.save

    respond_to do |format|
      if @club.save
        format.html { redirect_to @club, notice: 'Club was successfully created.' }
        format.json { render :show, status: :created, location: @club }
      else
        format.html { render :new }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clubs/1
  # PATCH/PUT /clubs/1.json
  def update
    respond_to do |format|
      if @club.update(club_params)
        format.html { redirect_to @club, notice: 'Club was successfully updated.' }
        format.json { render :show, status: :ok, location: @club }
      else
        format.html { render :edit }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clubs/1
  # DELETE /clubs/1.json
  def destroy
    @club.destroy
    respond_to do |format|
      format.html { redirect_to clubs_url, notice: 'Club was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club
      @club = Club.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def club_params
      params.require(:club).permit(:name, :description, :image, :university_id, :website, :owner_id)
    end
end
