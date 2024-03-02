require "application_system_test_case"
class CategoriesTest < ApplicationSystemTestCase
  setup do
    @user = users(:user_two)
    @category = categories(:categ_two)

    login
  end
  test "visiting the index" do
    assert_selector "h1", text: "NEW CATEGORY"
  end
  test "should create new Category and redirect to the Category page" do
    click_on "New Category"
    fill_in "Category Name:", with: @category.category_name
    click_on "Submit"

    assert_text "Category successfully added!"
    visit category_path(@category)
  end

  test "should update Category" do
    visit category_path(@category)
    assert_selector ".category-name", text: @category.category_name.upcase
    click_on @category.category_name

    new_category_name = "New Category Name"
    fill_in "Category Name:", with: new_category_name
    click_on "Submit"

    assert_text "Category name successfully updated!"
    assert_selector ".category-name", text: new_category_name.upcase
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
    assert page.has_css?(".navbar"), "Navbar not found."
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
