=begin
Edited by Lang Xu 4/19/2020, modified SessionsHelper module to add helper methods for log in
Edited by Lang Xu 4/22/2020, fixed bug when loggin in with landlords
=end
module SessionsHelper

    def login_s(student)
        session[:student_id] = student.id
    end

    def login_l(landlord)
        session[:landlord_id] = landlord.id
    end

    def current_student
        @current_student ||= Student.find_by(id: session[:student_id])
    end

    def current_landlord
        @current_landlord ||= Landlord.find_by(id: session[:landlord_id])
    end

    def student_logged_in?
        !current_student.nil?
    end

    def landlord_logged_in?
        !current_landlord.nil?
    end

    def log_out
        session.delete(:student_id)
        session.delete(:landlord_id)
        @current_student = nil
        @current_landlord = nil
    end
end
