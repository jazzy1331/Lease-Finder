# Edited 4/16/2020 by Ern Chi Khoo: Added instance variable 
# Edited 4/20/2020 by Ern Chi Khoo: Removed hard coded landlord_id 
# Edited 4/20/2020 by Ern Chi Khoo: Bug fix
# Edited 4/22/2020 by Ern Chi Khoo: Changed the landlord_id in show to match the id of the landlord
# Edited 4/24/2020 by Ern Chi Khoo: Redirect page to landing page after profile is deleted
# Edited 4/24/2020 by Lang Xu: Fixed log in method for landlord

class LandlordsController < ApplicationController
  before_action :set_landlord, only: [:show, :edit, :update, :destroy]

  # GET /landlords
  # GET /landlords.json
  def index
    @landlords = Landlord.all
  end

  # GET /landlords/1
  # GET /landlords/1.json
  def show
    @properties = Property.where(landlord_id:@landlord.id)
  end

  # GET /landlords/new
  def new
    @landlord = Landlord.new
  end

  # GET /landlords/1/edit
  def edit
  end

  # POST /landlords
  # POST /landlords.json
  # Edited by Lang Xu 4/19/2020, enabled auto log-in upon sign-up
  def create
    @landlord = Landlord.new(landlord_params)

    respond_to do |format|
      if @landlord.save
        login_l @landlord
        flash[:success] = "Welcome to the Lease Finder!"
        format.html { redirect_to @landlord}
        format.json { render :show, status: :created, location: @landlord }
      else
        format.html { render :new }
        format.json { render json: @landlord.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /landlords/1
  # PATCH/PUT /landlords/1.json
  def update
    respond_to do |format|
      if @landlord.update(landlord_params)
        flash[:success] = "Your Landlord profile was successfully updated!"
        format.html { redirect_to @landlord}
        format.json { render :show, status: :ok, location: @landlord }
      else
        format.html { render :edit }
        format.json { render json: @landlord.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /landlords/1
  # DELETE /landlords/1.json
  def destroy
    @landlord.destroy
    respond_to do |format|
      format.html { redirect_to :root }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_landlord
      @landlord = Landlord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def landlord_params
      params.require(:landlord).permit(:name, :email, :password, :phone, :website, :office)
    end
end
