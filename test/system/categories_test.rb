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
  test "should update Category on Category page" do
    visit category_path(@category)
    assert_selector ".category-name", text: @category.category_name.upcase
    click_on @category.category_name

    new_category_name = "New Category Name"
    fill_in "Category Name:", with: new_category_name
    click_on "Submit"

    assert_text "Category name successfully updated!"
    assert_selector ".category-name", text: new_category_name.upcase
  end
  test "should destroy Category on Category page" do
    visit category_path(@category)

    within(".delete-btn") do
      delete_button = find("a[href='#{category_path(@category)}'][data-turbo-method='delete']")

      accept_confirm do
        delete_button.click
      end
    end

    assert_text "Category permanently deleted."
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
