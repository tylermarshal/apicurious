require "rails_helper"

describe "a user goes to the homepage" do
  context "the user clicks on login with github" do
    it "the user logs in with github" do
      Capybara.app = Apicurious::Application

      omniauth_response

      visit "/"
      expect(page.status_code).to eq(200)
      click_link "Login with Github"
      expect(current_path).to eq("/dashboard")
      expect(page).to have_content("Tyler")
      expect(page).to have_link("Logout")

    end
  end
end
