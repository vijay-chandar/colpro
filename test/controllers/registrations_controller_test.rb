require 'test_helper'

class RegistrationsControllerTest < ActionController::TestCase
  setup do
    @registration = registrations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:registrations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create registration" do
    assert_difference('Registration.count') do
      post :create, registration: { abstract: @registration.abstract, college_name: @registration.college_name, department: @registration.department, email: @registration.email, file_upload: @registration.file_upload, first_name: @registration.first_name, last_name: @registration.last_name, mobile_number: @registration.mobile_number, paper_title: @registration.paper_title, type_of_conference: @registration.type_of_conference }
    end

    assert_redirected_to registration_path(assigns(:registration))
  end

  test "should show registration" do
    get :show, id: @registration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @registration
    assert_response :success
  end

  test "should update registration" do
    patch :update, id: @registration, registration: { abstract: @registration.abstract, college_name: @registration.college_name, department: @registration.department, email: @registration.email, file_upload: @registration.file_upload, first_name: @registration.first_name, last_name: @registration.last_name, mobile_number: @registration.mobile_number, paper_title: @registration.paper_title, type_of_conference: @registration.type_of_conference }
    assert_redirected_to registration_path(assigns(:registration))
  end

  test "should destroy registration" do
    assert_difference('Registration.count', -1) do
      delete :destroy, id: @registration
    end

    assert_redirected_to registrations_path
  end
end
