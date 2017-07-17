require "rails_helper"

RSpec.feature "User logs in" do
  scenario "with valid credentials" do
    user_attributes = {
      username: "rachelw",
      password: "secretpassword"
    }

    user = User.create(user_attributes)

    visit login_path
    fill_in "Username", with: user_attributes[:username]
    fill_in "session[password]", with: user_attributes[:password]

    click_on "Log In"

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome, #{user_attributes[:username]}")
    expect(page).to have_content("Successful login")
  end
end
