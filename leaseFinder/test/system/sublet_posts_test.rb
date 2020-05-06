require "application_system_test_case"

class SubletPostsTest < ApplicationSystemTestCase
  setup do
    @sublet_post = sublet_posts(:one)
  end

  test "visiting the index" do
    visit sublet_posts_url
    assert_selector "h1", text: "Sublet Posts"
  end

  test "creating a Sublet post" do
    visit sublet_posts_url
    click_on "New Sublet Post"

    fill_in "Bedroom num", with: @sublet_post.bedroom_num
    fill_in "Description", with: @sublet_post.description
    check "Electric flag" if @sublet_post.electric_flag
    fill_in "End date", with: @sublet_post.end_date
    check "Furnished flag" if @sublet_post.furnished_flag
    check "Gas flag" if @sublet_post.gas_flag
    fill_in "House rules", with: @sublet_post.house_rules
    fill_in "Housemates num", with: @sublet_post.housemates_num
    check "Internet flag" if @sublet_post.internet_flag
    fill_in "Monthly rent", with: @sublet_post.monthly_rent
    check "Other util flag" if @sublet_post.other_util_flag
    check "Parking flag" if @sublet_post.parking_flag
    fill_in "Start date", with: @sublet_post.start_date
    check "Taken" if @sublet_post.taken
    check "Water flag" if @sublet_post.water_flag
    click_on "Create Sublet post"

    assert_text "Sublet post was successfully created"
    click_on "Back"
  end

  test "updating a Sublet post" do
    visit sublet_posts_url
    click_on "Edit", match: :first

    fill_in "Bedroom num", with: @sublet_post.bedroom_num
    fill_in "Description", with: @sublet_post.description
    check "Electric flag" if @sublet_post.electric_flag
    fill_in "End date", with: @sublet_post.end_date
    check "Furnished flag" if @sublet_post.furnished_flag
    check "Gas flag" if @sublet_post.gas_flag
    fill_in "House rules", with: @sublet_post.house_rules
    fill_in "Housemates num", with: @sublet_post.housemates_num
    check "Internet flag" if @sublet_post.internet_flag
    fill_in "Monthly rent", with: @sublet_post.monthly_rent
    check "Other util flag" if @sublet_post.other_util_flag
    check "Parking flag" if @sublet_post.parking_flag
    fill_in "Start date", with: @sublet_post.start_date
    check "Taken" if @sublet_post.taken
    check "Water flag" if @sublet_post.water_flag
    click_on "Update Sublet post"

    assert_text "Sublet post was successfully updated"
    click_on "Back"
  end

  test "destroying a Sublet post" do
    visit sublet_posts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sublet post was successfully destroyed"
  end
end
