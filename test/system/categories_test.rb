require "application_system_test_case"
class CategoriesTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    `rake RAILS_ENV=test db:seed`
    @user = users(:user_one)
    @category = categories(:one)

    login
  end
  test "visiting the index" do
    assert_selector "h1", text: "NEW CATEGORY"
  end
  test "should create category and redirect to the category page" do
    click_on "New Category"
    fill_in "Category Name:", with: @category.category_name
    click_on "Submit"

    assert_text "Category successfully added!"
    visit category_path(@category)
  end

  private

  def login
    visit root_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: "111111"
    click_on "Login"

    assert_navbar
  end

  def assert_navbar
    assert_selector "img[alt='tsek.mo_logo']"
    assert_selector "div", text: "hello, #{@user.email}"
    assert_selector "a", text: "LOGOUT"
  end
end

=begin
  test "should update Category" do
    visit category_url(@category)
    click_on "Edit this category", match: :first

    fill_in "Category name", with: @category.category_name
    fill_in "User", with: @category.user_id
    click_on "Update Category"

    assert_text "Category was successfully updated"
    click_on "Back"
  end

  test "should destroy Category" do
    visit categories_url
    find("#delete-1")

    accept_alert do
      click_button "OK"
    end

    assert_text "Category permanently deleted."
  end

  test "should log out current user" do
    login

    click_on "Logout"
    page.driver.browser.switch_to.alert.accept
    visit new_user_session_path
  end
=end
