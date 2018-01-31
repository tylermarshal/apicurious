class EventService

  attr_reader :current_user

  def initialize(current_user)
    @current_user = current_user
  end

  def get_events
    GithubService.new(current_user).events.map do |event|
      if event[:type] == "PushEvent"
        PushEvent.new(event, current_user)
      elsif event[:type] == "CreateEvent"
        CreateEvent.new(event)
      elsif event[:type] == "PullRequestEvent"
        PullRequestEvent.new(event)
      end
    end
  end

  def formatted_events
    get_events.reduce(Hash.new) do |result, event|
      if result.has_key?(event.class)
        result[event.class] << event
      else
        result[event.class] = []
        result[event.class] << event
      end
      result
    end
  end

  #can add more methods to separate, group these repos

end
