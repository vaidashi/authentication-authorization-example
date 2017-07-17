require "rails_helper"

RSpec.feature "User logs out" do
  scenario "by clicking logout link" do
    user_attributes = {
      username: "miked",
      password: "password123"
    }

    user = User.create(user_attributes)

    ApplicationController.any_instance.stub(:current_user).and_return(user)
  
    visit user_path(user)
    click_on "Logout"

    expect(current_path).to eq(user_path(user))
    expect(page).to_not have_content("Welcome, #{user_attributes[:username]}")
    expect(page).to have_content("Goodbye")
  end
end


