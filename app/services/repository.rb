class Repository

  attr_reader :name, :url, :owner, :owner_url, :description,
              :updated_at, :language, :forks_count

  def initialize(attrs)
    @name = attrs[:name]
    @url = attrs[:html_url]
    @owner = attrs[:owner][:login]
    @owner_url = attrs[:owner][:html_url]
    @description = attrs[:description]
    @updated_at = attrs[:updated_at]
    @language = attrs[:language]
    @forks_count = attrs[:forks_count]
  end
end
