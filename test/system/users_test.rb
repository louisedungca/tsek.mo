require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:user_one)
  end

  test "should sign in existing user and edit details" do
    visit user_session_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: "111111"
    click_on "Login"

    assert_navbar
    assert_text "Sign in success."

    within(".navbar") do
      click_on @user.email
    end

    new_email = "hello@test.com"
    new_password = "new_password"

    fill_in "Email", with: new_email
    fill_in "Password", with: new_password
    fill_in "Password confirmation", with: new_password
    fill_in "Current password", with: "111111"
    click_on "Update"

    within(".navbar") do
      assert_selector "div", text: new_email
    end

    assert_text "Your account has been successfully updated."
  end

  test "should register new user and destroy user" do
    visit new_user_registration_path

    email = "hello@test.com"
    password = "password"
    fill_in "Email", with: email
    fill_in "Password", with: password
    fill_in "Password confirmation", with: password
    click_on "Sign up"

    assert_navbar
    assert_text "Welcome! You have successfully signed up."

    within(".navbar") do
      click_on email
    end

    accept_confirm do
      click_on "Delete Account"
    end

    assert_text "Please log in to your account to continue."

    fill_in "Email", with: email
    fill_in "Password", with: password
    click_on "Login"

    assert_text "Invalid Email or password."
  end

  private

  def assert_navbar
    assert page.has_css?(".navbar"), "Navbar not found."
  end

end
