require 'nokogiri'
require 'icalendar'

module Parsers
  class GorkiParser < Parser
    URL = 'https://gorki.de'

    def self.get_newest_data
      res = []
      [Date.today, 1.month.from_now, 2.month.from_now].each do |date|
        parser = self.new(URL + '/en/programme/' + date.year.to_s + '/' + date.month.to_s + '/all')
        parser.perform
        res << parser.content_json
      end
      res.flatten.uniq
    end

    def get_data
      self.content_html = Nokogiri::HTML(open(self.url))
      true
    end

    def parse_data
      self.content_json = []
      self.content_html.css('.item-list').each do |site|
        subtitle = site.css('.cast').inner_text.
            strip.gsub("\n", '').
            split(' ').collect(&:strip).
            compact.join(' ')
        ics_address = site.css('a.is-ical')[0].attributes['href'].value
        content = GorkiParser.parse_ics(ics_address)
        content[:subtitle] = subtitle
        self.content_json << content
      end
      true
    end

    def self.parse_ics(ics_address)
      cal = Icalendar::Calendar.parse(open(URL + ics_address).read)[0]
      event = cal.events.first
      return {
          url: event.url.to_s,
          event_start: event.dtstart,
          event_end: event.dtend,
          title: event.summary
      }
    end
  end
end
