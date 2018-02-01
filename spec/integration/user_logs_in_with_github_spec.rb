require "rails_helper"

describe "a user goes to the homepage" do
  context "the user clicks on login with github" do
    it "the user logs in with github" do
      Capybara.app = Apicurious::Application

      # first, set OmniAuth to run in test mode
      OmniAuth.config.test_mode = true
      # then, provide a set of fake oauth data that
      # omniauth will use when a user tries to authenticate:
      OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({"provider"=>"github",
 "uid"=>12345,
 "credentials"=>{"token"=>ENV["GITHUB_TOKEN"]},
 "extra"=>
  {"raw_info"=>
    {"login"=>"tylermarshal",
     "avatar_url"=>"https://avatars3.githubusercontent.com/u/7504391?v=4",
     "name"=>"Tyler Madsen",
     "company"=>nil,
     "location"=>"Denver, CO",
     "email"=>"madsen.tyler@gmail.com",
     "bio"=>"Backend Software Developer & SEO",
     "public_repos"=>34,
     "followers"=>3,
     "following"=>1,
     "updated_at"=>"2018-01-29T22:06:59Z"}}})

      visit "/"
      expect(page.status_code).to eq(200)
      click_link "Login with Github"
      expect(current_path).to eq("/dashboard")
      expect(page).to have_content("Tyler")
      expect(page).to have_link("Logout")

    end
  end
end
