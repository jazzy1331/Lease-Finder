#Edited by Daniel Lim on 4/21/2020: added test cases
require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student = students(:one)
    @current_student = students(:one)
  end

  #test for validation of password
  test "should be not valid if password is not present" do
    @student.password = ""
    assert_not @student.valid?
  end

  test "password should be present" do
    @student.password = "123"
    assert @student.valid?
  end

  #test for validation of email
  test "should be not valid if email does not follow regex" do
    @student.email = "123123"
    assert_not @student.valid?
  end

  test "email should be follow regex" do
    @student.password = "123@gmail.com"
    assert @student.valid?
  end

  #test for length of phone number
  test "should be not valid if phone number is less than 10" do
    @student.email = "123-123"
    assert_not @student.valid?
  end

  test "phone number should be more than 10 " do
    @student.password = "123-123-1234"
    assert @student.valid?
  end

  #test for uniqueness
  test "email addresses should be unique" do
    duplicate_user = @student.dup
    duplicate_user.email = @student.email.upcase
    @student.save
    assert_not duplicate_user.valid?
  end

  test "password should be unique" do
    duplicate_user = @student.dup
    duplicate_user.password = @student.password
    @student.save
    assert_not duplicate_user.valid?
  end

  #test for edit
  test "successful edit" do
    get edit_student_path(@student)
    assert_template 'students/edit'
    first_name = "abc"
    stu_email = "abc@gmail.com"
    patch student_path(@student), params: {student: {fname:first_name, lname:"abc", email:stu_email, password:"abcabc", phone:"123-123-1234", dob:"1999-04-07"}}
    assert_redirected_to @student
    @student.reload
    assert_equal first_name,  @student.fname
    assert_equal stu_email, @student.email
  end

  test "unsuccessful edit" do
    get edit_student_path(@student)
    assert_template 'students/edit'
    patch student_path(@student), params: {student: {fname:"abc", lname:"abc", email:"abc", password:"abcabc", phone:"123", dob:"1999-04-07"}}
    assert_template 'students/edit'
  end

  #test for routing
  test "should get index" do
    get students_url
    assert_response :success
  end

  test "should get new" do
    get new_student_url
    assert_response :success
  end


  test "should show student" do
    get students_url(@current_student)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_url(@student)
    assert_response :success
  end


  # test "should destroy student" do
  #   assert_difference('Student.count', -1) do
  #     delete student_url(@student)
  #   end

  #   assert_redirected_to students_url
  # end



end
