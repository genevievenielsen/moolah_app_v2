class EmailsController < ApplicationController
  before_action :set_email, only: [:show, :edit, :update, :destroy]

  def club_emails
    @club = Club.find_by(:id => params[:id])

  end

  def import_emails
    @club = Club.find_by(:id => params[:id])


    spreadsheet = Email.open_spreadsheet(params[:file])
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      email = Email.new
      email.attributes = row.to_hash
      email.club_id = @club.id


      #remove any duplicates
      club_email_list = Email.where(:club_id => @club.id)
      if club_email_list.pluck(:email).include?(email.email)
        email.destroy
      else
        email.save!
        #send a welcome email
        # Notifier.imported_email_welcome(email, @club).deliver
      end

      #check to see if the email exists as a user
      #if so, check to see if a membership exists
      #if not, create one
      club_email_list = Email.where(:club_id => @club.id).pluck(:email)
      existing_users = User.where(:email => club_email_list)

       if existing_users.present?
        existing_users.each do |user|
          if Membership.find_by(:user_id => user.id, :club_id => @club.id).present?
          else
            m = Membership.new
            m.user_id = user.id
            m.club_id = @club.id
            m.save
          end
        end
       end

    end

    redirect_to club_url(@club.id), notice: "Email list imported."
  end
  # GET /emails
  # GET /emails.json
  def index
    @emails = Email.all
  end

  # GET /emails/1
  # GET /emails/1.json
  def show
  end

  # GET /emails/new
  def new
    @email = Email.new
  end

  # GET /emails/1/edit
  def edit
  end

  # POST /emails
  # POST /emails.json
  def create
    @email = Email.new(email_params)

    respond_to do |format|
      if @email.save
        format.html { redirect_to @email, notice: 'Email was successfully created.' }
        format.json { render :show, status: :created, location: @email }
      else
        format.html { render :new }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emails/1
  # PATCH/PUT /emails/1.json
  def update
    respond_to do |format|
      if @email.update(email_params)
        format.html { redirect_to @email, notice: 'Email was successfully updated.' }
        format.json { render :show, status: :ok, location: @email }
      else
        format.html { render :edit }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emails/1
  # DELETE /emails/1.json
  def destroy
    @email.destroy
    respond_to do |format|
      format.html { redirect_to emails_url, notice: 'Email was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email
      @email = Email.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_params
      params.require(:email).permit(:first_name, :last_name, :email, :club_id)
    end
end
