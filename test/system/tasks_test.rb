require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  setup do
    @user = users(:user_one)
    @category = categories(:categ_one)
    @task = tasks(:task_one)

    login
  end

  test "should create Task" do
    visit category_path(@category)

    within(".form__block") do
      fill_in "Due Date:", with: @task.due_date
      fill_in "Task:", with: @task.task_item
      click_on "Create Task"
    end

    assert_text "Task successfully added!"
  end

  test "should update Task" do
    visit category_path(@category)

    within(".task-btns") do
      edit_button = find("a[href='#{edit_category_task_path(@category, @task)}']")
      edit_button.click
    end

    within(".form__block") do
      new_due_date = "2024-03-15 00:00:00"
      new_task_name = "Edited Task Name"

      fill_in "Due Date:", with: new_due_date
      fill_in "Task:", with: new_task_name
      click_on "Submit"
    end

    assert_text "Task item successfully updated!"
    click_on "Home"
  end

  test "should destroy Task" do
    visit category_path(@category)

    within(".task-btns") do
      delete_button = find("a[href='#{category_task_path(@category, @task)}'][data-turbo-method='delete']")

      accept_confirm do
        delete_button.click
      end
    end

    assert_text "Task permanently deleted."
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
