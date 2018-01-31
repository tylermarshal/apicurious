class DashboardController < ApplicationController
  def index
    @user_repos = RepoService.new(current_user).create_repos
    @user_orgs = GithubService.new(current_user).orgs
    @user_starred = GithubService.new(current_user).starred
    @user_events = EventService.new(current_user).formatted_events
  end
end
