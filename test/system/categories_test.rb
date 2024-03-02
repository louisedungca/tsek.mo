require "application_system_test_case"

class CategoriesTest < ApplicationSystemTestCase
  setup do
    @user = users(:user_one)
    @category = categories(:one)
    `rake RAILS_ENV=test db:seed`
  end

  test "visiting the index and create new category" do
    visit categories_url

    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.encrypted_password
    click_on "Login"

    assert_selector "h1", text: "NEW CATEGORY"

    click_on "New Category"

    fill_in "Category Name:", with: @category.category_name
    click_on "Submit"

    assert_text "Category successfully added!"

    # visit categories_url
    # find("#delete-1")

    # accept_alert do
    #   click_button "OK"
    # end

    # assert_text "Category permanently deleted."
  end

=begin
  test "should create category" do
    visit root_path

    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.encrypted_password
    click_on "Login"

    click_on "New Category"

    fill_in "Category Name:", with: @category.category_name
    click_on "Submit"

    assert_text "Category successfully added!"
  end


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
    visit category_url(@category)
    click_on "Destroy this category", match: :first

    assert_text "Category was successfully destroyed"
  end
=end

end
