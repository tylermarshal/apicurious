class Commit

  attr_reader :message, :api_url, :date, :commit_url

  def initialize(repo, public_status, commit)
    @rep = repo
    @public_status = public_status
    @message = commit[:commit][:message]
    @date = commit[:commit][:author][:date]
    @commit_url = commit[:html_url]
    @total = commit[:stats][:total]
    @additions = commit[:stats][:additions]
    @deletions = commit[:stats][:deletions]
  end

end
