json.extract! student, :id, :fname, :lname, :email, :password, :phone, :dob, :created_at, :updated_at
json.url student_url(student, format: :json)
