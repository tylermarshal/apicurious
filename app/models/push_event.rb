class PushEvent

  attr_reader :repo, :public_status, :commit_urls

  def initialize(event)
    @repo = event[:repo][:name]
    @public_status = event[:public]
    @commit_urls = event[:payload][:commits].map {|commit| commit[:url]}
  end

  def create_commits
    commit_urls.each do |commit|
      response = conn.get("#{commit}")
      commit_event = JSON.parse(response.body, symbolize_names: true)
      Commit.new(repo, public_status, commit_event)
    end
  end

end
