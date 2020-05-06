require 'test_helper'

class SubletPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sublet_post = sublet_posts(:one)
  end

  # test "should get index" do
  #   get sublet_posts_url
  #   assert_response :success
  # end

  # test "should get new" do
  #   get new_sublet_post_url
  #   assert_response :success
  # end

  # test "should create sublet_post" do
  #   assert_difference('SubletPost.count') do
  #     post sublet_posts_url, params: { sublet_post: { bedroom_num: @sublet_post.bedroom_num, description: @sublet_post.description, electric_flag: @sublet_post.electric_flag, end_date: @sublet_post.end_date, furnished_flag: @sublet_post.furnished_flag, gas_flag: @sublet_post.gas_flag, house_rules: @sublet_post.house_rules, housemates_num: @sublet_post.housemates_num, internet_flag: @sublet_post.internet_flag, monthly_rent: @sublet_post.monthly_rent, other_util_flag: @sublet_post.other_util_flag, parking_flag: @sublet_post.parking_flag, start_date: @sublet_post.start_date, taken: @sublet_post.taken, water_flag: @sublet_post.water_flag } }
  #   end

  #   assert_redirected_to sublet_post_url(SubletPost.last)
  # end

  # test "should show sublet_post" do
  #   get sublet_post_url(@sublet_post)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_sublet_post_url(@sublet_post)
  #   assert_response :success
  # end

  # test "should update sublet_post" do
  #   patch sublet_post_url(@sublet_post), params: { sublet_post: { bedroom_num: @sublet_post.bedroom_num, description: @sublet_post.description, electric_flag: @sublet_post.electric_flag, end_date: @sublet_post.end_date, furnished_flag: @sublet_post.furnished_flag, gas_flag: @sublet_post.gas_flag, house_rules: @sublet_post.house_rules, housemates_num: @sublet_post.housemates_num, internet_flag: @sublet_post.internet_flag, monthly_rent: @sublet_post.monthly_rent, other_util_flag: @sublet_post.other_util_flag, parking_flag: @sublet_post.parking_flag, start_date: @sublet_post.start_date, taken: @sublet_post.taken, water_flag: @sublet_post.water_flag } }
  #   assert_redirected_to sublet_post_url(@sublet_post)
  # end

  # test "should destroy sublet_post" do
  #   assert_difference('SubletPost.count', -1) do
  #     delete sublet_post_url(@sublet_post)
  #   end

  #   assert_redirected_to sublet_posts_url
  # end
end
