=begin
Edited by Lang Xu 4/19/2020, added log in sessions controller code 
=end
class SessionsController < ApplicationController
  def login_student
  end

  def create_student_session
    student = Student.find_by(email: params[:session][:email].downcase)
    if student && student.authenticate(params[:session][:password])
      login_s student
      redirect_to student
      # Log the user in and redirect to the user's show page.
    else
      flash.now[:danger] = 'Invalid Email/Password combination' # Not quite right!
      render 'login_student'
    end
  end

  def login_landlord
  end

  def create_landlord_session
    landlord = Landlord.find_by(email: params[:session][:email].downcase)
    if landlord && landlord.authenticate(params[:session][:password])
      login_l landlord
      redirect_to landlord
      # Log the user in and redirect to the user's show page.
    else
      flash.now[:danger] = 'Invalid Email/Password combination' # Not quite right!
      render 'login_landlord'
    end
  end

  def destroy
    log_out if student_logged_in? || landlord_logged_in?
    redirect_to root_url
  end
end
