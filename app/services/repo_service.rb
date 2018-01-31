class RepoService

  attr_reader :current_user

  def initialize(current_user)
    @current_user = current_user
  end

  def create_repos
    GithubService.new(current_user).repos.map do |repo|
      Repository.new(repo)
    end
  end

end
