class Parser
  attr_accessor :url, :content_json, :content_html

  def initialize(url)
    @url = url
  end

  def perform
    self.get_data && self.parse_data
    true
  end
end
