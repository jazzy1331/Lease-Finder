#Edited by Daniel Lim on 4/16/2020: added find subletPost from the student id 
# Edited by Daniel Lim on 4/20/2020: added @sublet_posts to show
# Edited by Ern Chi Khoo on 4/24/2020: Redirected page to landing page after profile is deleted
# Edited by Lang Xu on 4/24/2020: deleted extranuous notices and fixed log in bug

class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end

  # GET /students/1
  # GET /students/1.json
  def show
    # student_id should be the current user id 
    @sublet_posts = @student.sublet_posts
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
    set_student
  end

  # POST /students
  # POST /students.json
  # Edited by Lang Xu 4/19/2020, added auto log-in upon sign-up for students
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        login_s @student
        flash[:success] = "Welcome to the Lease Finder!"
        format.html { redirect_to @student }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        flash[:success] = "Your Student profile was successfully updated!"
        format.html { redirect_to @student }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to :root }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:fname, :lname, :email, :password, :phone, :dob)
    end
end
