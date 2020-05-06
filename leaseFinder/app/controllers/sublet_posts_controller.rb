=begin
 Edited 4/15/2020 by Juhee Park: modify index to show only posts that are not taken  
 Edited by Daniel Lim on4/16/2020: added element in sublet_post_params
 Edited 4/19/20 by Jas Bawa: Edited set_sublet_post to set all information needed for partials
 Edited by Daniel Lim on 4/16/2020: added element in sublet_post_params 
 Edtied by Daniel Lim on 4/19/20: added if statement into the index
 Edtied by Daniel Lim on 4/20/20: added @properties to new and edit and added @student to show
 Edited 4/20/20 by Juhee Park: Added filterrific
=end


class SubletPostsController < ApplicationController
  before_action :set_sublet_post, only: [:show, :edit, :update, :destroy]
  # GET /sublet_posts
  # GET /sublet_posts.json
  def index
    @filterrific = initialize_filterrific(
      SubletPost,
      params[:filterrific],
      select_options: {
        sorted_by: SubletPost.options_for_sorted_by,
        with_furnished: SubletPost.options_for_flags,
        with_parking: SubletPost.options_for_flags,
        with_pet_friendly: SubletPost.options_for_flags
      },
      :persistence_id => false,
    ) or return

    @filtered = @filterrific.find()
    
    # get all the posts that are not taken and their linked properties
    @sublet_posts = Hash.new
    # get all students who created each post
    @students = Hash.new

    @filtered.where(taken:false).each do |sublet_post|
      @sublet_posts[sublet_post] = Property.find(sublet_post.property_id)
      @students[sublet_post] = Student.find(sublet_post.student_id)

    end

    respond_to do |format|
      format.html
      format.js
    end
    puts("HELLO3")
    puts(params[:filterrific].inspect)
    # Reset filterrific and discard filter params if invalid param sets
    # rescue ActiveRecord::RecordNotFound => e
    #   puts "Had to reset filterrific params: #{e.message}"
    #   redirect_to(reset_filterrific_url(format: :html)) && return
    # end
  end

  # GET /sublet_posts/1
  # GET /sublet_posts/1.json
  def show
    @student = Student.find(@sublet_post.student.id)
  end

  # GET /sublet_posts/new
  def new
    @sublet_post = SubletPost.new
    @properties = Property.all
    @edit = 0

  end

  # GET /sublet_posts/1/edit
  def edit
    @edit = 1
    @properties = Property.all

  end

  # POST /sublet_posts
  # POST /sublet_posts.json
  def create
    @sublet_post = SubletPost.new(sublet_post_params)
    respond_to do |format|
      if @sublet_post.save
        format.html { redirect_to @sublet_post, notice: 'Sublet post was successfully created.' }
        format.json { render :show, status: :created, location: @sublet_post }
      else
        format.html { render :new }
        format.json { render json: @sublet_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sublet_posts/1
  # PATCH/PUT /sublet_posts/1.json
  def update
    respond_to do |format|
      if @sublet_post.update(sublet_post_params)
        format.html { redirect_to @sublet_post, notice: 'Sublet post was successfully updated.' }
        format.json { render :show, status: :ok, location: @sublet_post }
      else
        format.html { render :edit }
        format.json { render json: @sublet_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sublet_posts/1
  # DELETE /sublet_posts/1.json
  def destroy
    @sublet_post.destroy
    respond_to do |format|
      format.html { redirect_to sublet_posts_url, notice: 'Sublet post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sublet_post
      @sublet_post = SubletPost.find(params[:id])
      @property = Property.find(@sublet_post.property_id)
      @all_reviews = Review.new
      @all_reviews.property_id = @property.id
      @reviews = Review.where(property_id: @property.id)
    end

    # Only allow a list of trusted parameters through.
    def sublet_post_params
      params.require(:sublet_post).permit(:housemates_num, :monthly_rent, :water_flag, :gas_flag, :electric_flag, :internet_flag, :other_util_flag, :start_date, :end_date, :bedroom_num, :furnished_flag, :parking_flag, :house_rules, :taken, :description, :student_id, :property_id)
    end

    def filter_params
      params.slice(:sorted_by, :with_housemates_num, :with_min_monthly_rent, :with_max_monthly_rent, :with_start_date, :with_end_date, :with_bedroom_num,
            :with_furnished, :with_parking, :with_pet_friendly)
    end
end
