require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get call_for_papers" do
    get :call_for_papers
    assert_response :success
  end

  test "should get important_dates" do
    get :important_dates
    assert_response :success
  end

  test "should get paper_ethics" do
    get :paper_ethics
    assert_response :success
  end

  test "should get committee" do
    get :committee
    assert_response :success
  end

  test "should get venue_and_contact" do
    get :venue_and_contact
    assert_response :success
  end

end
