class DashboardController < ApplicationController
  def index
    conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers['Authorization'] = ["token #{current_user.token}"]
      faraday.adapter Faraday.default_adapter
    end
    response = conn.get("/user/repos")
    @user_repos = JSON.parse(response.body, symbolize_names: true).map do |repo|
      Repository.new(repo)
    end
    @user_orgs = GithubService.new(current_user).orgs
    @user_starred = GithubService.new(current_user).starred
    @user_events = EventService.new(current_user).formatted_events
  end
end
