class PullRequestEvent

  attr_reader :repo, :type, :created_at, :action, :public

  def initialize(event)
    @repo = event[:repo][:name]
    @type = event[:payload][:ref_type]
    @created_at = event[:created_at]
    @action = event[:payload][:action]
    @public = event[:public]
  end

end
