require 'nokogiri'

module Parsers
  class CoBerlinParser < Parser
    URL = 'https://www.co-berlin.org'

    def self.get_newest_data
      parser = self.new(URL)
      parser.perform
      parser.get_data
      parser.content_json
    end

    def get_data
      self.content_html = Nokogiri::HTML(open(self.url + '/en/calender'))
      true
    end

    def parse_data
      self.content_json = []
      self.content_html.css('.seite-c-single').each do |site|
        dates = site.css('.article-date').text.split('to').collect(&:strip)
        self.content_json << {
            event_start: Date.strptime(dates[0], '%d/%m/%y'),
            event_end: dates[1].present? ? Date.strptime(dates[1], '%d/%m/%y') : nil,
            title: site.css('.article-title').text,
            subtitle: site.css('.article-subtitle').text,
            content: site.css('.article-text').text,
            url: URL + site.css('.calender-text a')[0].attributes['href'].value
        }
      end
      true
    end
  end
end
