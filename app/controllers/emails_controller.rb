class EmailsController < ApplicationController
  before_action :set_email, only: [:show, :edit, :update, :destroy, :read]

  # GET /emails
  # GET /emails.json
  def index
    @emails = Email.all
  end

  # GET /emails/1
  # GET /emails/1.json
  def show
    @email.update_attribute(:marks_as_read, true)
    respond_to do |format|
        format.html { redirect_to root_path }
        format.js{}
    end
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
    @email = Email.create(object: Faker::Book.title, body: Faker::ChuckNorris.fact)

    respond_to do |format|
      if @email.save
        flash[:success] = 'Email was successfully created.' 
        format.html { redirect_to root_path }
        format.json { render :show, status: :created, location: @email }
        format.js{}
      else
        flash[:error] = 'Email could not be created.'
        format.html { render :new }
        format.json { render json: @email.errors, status: :unprocessable_entity }
        format.js{}
      end
    end


  end

  # PATCH/PUT /emails/1
  # PATCH/PUT /emails/1.json
  def update
    if @email.marks_as_read == true
      @email.update_attribute(:marks_as_read, false)
      respond_to do |format|
      format.html { redirect_to root_path, notice: "Marked as un-read" }
      format.js { }
      end
    else
      @email.update_attribute(:marks_as_read, true)
      respond_to do |format|
        format.html { redirect_to root_path, notice: "Marked as read" }
        format.js { }
        end
    end
  
  end

  # DELETE /emails/1
  # DELETE /emails/1.json
  def destroy

    respond_to do |format|
      if @email.destroy
        flash[:success] = 'Email was successfully deleted.' 
        format.html { redirect_to root_path }
        format.json { head :no_content }
        format.js{}
      else
        flash[:error] = 'Email could not be deleted.'
        format.html { redirect_to @email }
        format.js{}
      end
    end
  end

  def read
    if @email.marks_as_read == true
      @email.update_attribute(:marks_as_read, false)
      redirect_to root_path, notice: "Marked as un-read"
    else
      @email.update_attribute(:marks_as_read, true)
      redirect_to root_path, notice: "Marked as read"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email
      @email = Email.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def email_params
      params.require(:email).permit(:object, :body)
    end
end
