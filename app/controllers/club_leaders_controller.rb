class ClubLeadersController < ApplicationController
  before_action :set_club_leader, only: [:show, :edit, :update, :destroy]

  # GET /club_leaders
  # GET /club_leaders.json
  def index
    @club_leaders = ClubLeader.all
  end

  # GET /club_leaders/1
  # GET /club_leaders/1.json
  def show
  end

  # GET /club_leaders/new
  def new
    @club = Club.find(params[:id])
    @club_leader = ClubLeader.new
  end

  # GET /club_leaders/1/edit
  def edit
  end

  # POST /club_leaders
  # POST /club_leaders.json
  def create
    @club_leader = ClubLeader.new(club_leader_params)

    @club = @club_leader.club

    respond_to do |format|
      if @club_leader.save
        format.html { redirect_to leadership_url(@club), notice: 'Club leader was successfully created.' }
        format.json { render :show, status: :created, location: @club_leader }
      else
        format.html { render :new }
        format.json { render json: @club_leader.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /club_leaders/1
  # PATCH/PUT /club_leaders/1.json
  def update
    respond_to do |format|
      if @club_leader.update(club_leader_params)
        format.html { redirect_to @club_leader, notice: 'Club leader was successfully updated.' }
        format.json { render :show, status: :ok, location: @club_leader }
      else
        format.html { render :edit }
        format.json { render json: @club_leader.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /club_leaders/1
  # DELETE /club_leaders/1.json
  def destroy
    @club_leader.destroy
    respond_to do |format|
      format.html { redirect_to club_leaders_url, notice: 'Club leader was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club_leader
      @club_leader = ClubLeader.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def club_leader_params
      params.require(:club_leader).permit(:first_name, :last_name, :title, :club_id, :image)
    end
end
