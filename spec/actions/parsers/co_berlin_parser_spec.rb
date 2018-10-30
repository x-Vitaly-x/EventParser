require 'rails_helper'
require 'nokogiri'

RSpec.describe Parsers::CoBerlinParser, type: :model do
  CO_BERLIN_RESPONSE = ["Nicholas Nixon", "Guided tours at the weekend ", "Back to the Future", "And it moves!", "Junior 05 . Wunder der Dunkelkammer ", "Teens 07 . Porträt auf Zeit!", "Teens 08 . Aus dem Nichts ", "After Work Guided Tour & Drink ", "Junior 06 . Malen mit Licht", "Next opening"]

  describe '#perform' do
    it 'parses sample response' do
      allow_any_instance_of(Parsers::CoBerlinParser).to receive(:get_data) {|parser|
        parser.content_html = Nokogiri::HTML(File.open(File.join(Rails.root, 'spec', 'co_berlin_sample.html')))
      }
      response = Parsers::CoBerlinParser.get_newest_data.collect {|res| res[:title]}
      expect(response).to eq(CO_BERLIN_RESPONSE)
    end
  end
end
