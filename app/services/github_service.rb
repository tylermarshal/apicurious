class GithubService

  attr_reader :current_user

  def initialize(current_user)
    @current_user = current_user
  end

  def events
    json_parse(conn.get("/users/#{current_user.username}/events"))
  end

  def commit_conn(commit_url)
    Faraday.new(url: commit_url) do |faraday|
      faraday.headers['Authorization'] = ["token #{current_user.token}"]
      faraday.adapter Faraday.default_adapter
    end
  end

  def orgs
    json_parse(conn.get("/users/#{current_user.username}/orgs"))
  end

  def starred
    json_parse(conn.get("/users/#{current_user.username}/starred"))
  end

  def json_parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers['Authorization'] = ["token #{current_user.token}"]
      faraday.adapter Faraday.default_adapter
    end
  end

end
