require 'rails_helper'
require 'nokogiri'

RSpec.describe Parsers::GorkiParser, type: :model do
  GORKI_RESPONSE = [{:event_end => 'time end',
               :event_start => 'time start',
               :subtitle => "By Lola Arias & Ensemble Directed by Lola Arias",
               :title => "test",
               :url => "test url"}]
  describe '#perform' do
    it 'parses sample response' do
      allow_any_instance_of(Parsers::GorkiParser).to receive(:get_data) {|parser|
        parser.content_html = Nokogiri::HTML(File.open(File.join(Rails.root, 'spec', 'gorki_sample.html')))
      }
      allow(Parsers::GorkiParser).to receive(:parse_ics).and_return(
          {
              url: 'test url',
              event_start: 'time start',
              event_end: 'time end',
              title: 'test'
          }
      )
      expect(Parsers::GorkiParser.get_newest_data).to eq(GORKI_RESPONSE)
    end
  end
end
