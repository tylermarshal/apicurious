require 'rails_helper'

RSpec.describe User, type: :model do
  context "instance methods" do
    it "#from_omniauth" do
      user = User.from_omniauth(omniauth_response)

      last_user = User.last
      expect(last_user.uid).to eq(user.uid)
      expect(last_user.name).to eq(user.name)
      expect(last_user.username).to eq(user.username)
      expect(last_user.avatar).to eq(user.avatar)
      expect(last_user.followers).to eq(user.followers)
      expect(last_user.following).to eq(user.following)
      expect(last_user.public_repos).to eq(user.public_repos)
      expect(last_user.company).to eq(user.company)
      expect(last_user.location).to eq(user.location)
      expect(last_user.bio).to eq(user.bio)
      expect(last_user.email).to eq(user.email)
      expect(last_user.last_updated).to eq(user.last_updated)
      expect(last_user.token).to eq(user.token)
    end
  end
end
