#Edited 4/16/20 by Jas Bawa: Added instance variables for review
# Edited 4/19/20 by Jas Bawa: Edited the set_property method to set up a new review with the property id at page load
# Edited 4/19/2020 by Ern Chi Khoo: Added instance variable for edit and new
# Edited 4/19/2020 by Ern Chi Khoo: Changed redirection after creating, updating and removing property
# Edited 4/20/2020 by Ern Chi Khoo: Removed hard coding in landlord_id 

class PropertiesController < ApplicationController
  # before_action :set_property, only: [:show, :edit, :update, :destroy]
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  # GET /properties
  # GET /properties.json
  def index
    @properties = Property.all
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
    @reviews = Review.where(property_id: @property.id)
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
    # To set the text on the button
    @edit = 1
  end

  # POST /properties
  # POST /properties.json
  def create
    @property = Property.new(property_params)
    @edit = 0
    puts @landlord_id

    respond_to do |format|
      if @property.save
        format.html {
          redirect_to({controller:"landlords", action:"show", id:current_landlord}, notice:"Property was successfully created.")
        }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { 
          redirect_to({controller:"landlords", action:"show", id:current_landlord}, notice:"Property was successfully updated.")
        }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { 
        redirect_to({controller:"landlords", action:"show", id:current_landlord}, notice:"Property was successfully destroyed.")
      } 
      format.json { head :no_content }
    end
  end

  def records
    @reviews = Review.find params[:id]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
      @all_reviews = Review.new
      @all_reviews.property_id = @property.id
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.require(:property).permit(:landlord_id, :address, :total_bedrooms, :total_bathrooms, :pet_friendly)
    end
end

