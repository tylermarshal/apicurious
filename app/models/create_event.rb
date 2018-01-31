class CreateEvent

  attr_reader :repo, :type, :created_at

  def initialize(event)
    @repo = event[:repo][:name]
    @type = event[:payload][:ref_type]
    @created_at = event[:created_at]
    @public = event[:public]
  end
end
