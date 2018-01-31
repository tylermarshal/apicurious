class PushEvent

  attr_reader :repo, :public_status, :commit_urls, :current_user

  def initialize(event, current_user)
    @repo = event[:repo][:name]
    @public_status = event[:public]
    @commit_urls = event[:payload][:commits].map {|commit| commit[:url]}
    @current_user = current_user
  end

  def create_commits
    commit_urls.map do |commit_url|
      commit_event = GithubService.new(current_user).commit_conn(commit_url)
      Commit.new(repo, public_status, commit_event)
    end
  end

end
