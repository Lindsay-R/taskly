require 'rails_helper'
require 'capybara/rails'

feature 'Task lists' do

  scenario 'User can view task lists' do
    create_user email: "user@example.com"
    TaskList.create!(name: "Work List")
    TaskList.create!(name: "Household Chores")

    visit signin_path
    click_on "Login"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"
    expect(page).to have_content("Work List")
    expect(page).to have_content("Household Chores")
  end

  scenario 'Anonymous user can view about page' do
    visit signin_path
    click_on "About"
    expect(page).to have_content("About")
  end

  scenario 'User can add a task list' do
    create_user email: "user@example.com"
    TaskList.create!(name: "Work List")
    TaskList.create!(name: "Household Chores")

    visit signin_path
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"
    expect(page).to have_content("Work List")
    expect(page).to have_content("Household Chores")

    click_on "Add Task List"
    fill_in "Name", with: "Lindsay"
    click_on "Create Task List"
    expect(page).to have_content("Task List was created successfully!")
    expect(page).to have_content("My Lists")
  end

  scenario 'User must fill out a title for the task list' do
    create_user email: "user@example.com"
    TaskList.create!(name: "Work List")
    TaskList.create!(name: "Household Chores")

    visit signin_path
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"
    expect(page).to have_content("Work List")
    expect(page).to have_content("Household Chores")

    click_on "Add Task List"
    click_on "Create Task List"
    expect(page).to have_content("Your task could not be created")
    expect(page).to have_content("Add a task list")
  end

  scenario 'User can edit a task list' do
    create_user email: "user@example.com"
    TaskList.create!(name: "Work List")

    visit signin_path
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"
    expect(page).to have_content("My Lists")
    expect(page).to have_content("Work List")

    click_on "Edit"
    expect(page).to have_content("Edit a task list")
    expect(page).to have_content("Work List")
    fill_in "Name", with: "Household Chores"
    click_on "Update Task List"
    expect(page).to have_content("Your task list was successfully updated!")
    expect(page).to have_content("Household Chores")
  end

end