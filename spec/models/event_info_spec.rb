require 'rails_helper'

RSpec.describe EventInfo, type: :model do
  describe '#sync' do
    it 'calls correstponding parser methods' do
      allow(Parsers::CoBerlinParser).to receive(:get_newest_data).and_return([])
      allow(Parsers::GorkiParser).to receive(:get_newest_data).and_return([])
      expect(Parsers::CoBerlinParser).to receive(:get_newest_data)
      expect(Parsers::GorkiParser).to receive(:get_newest_data)
      EventInfo.sync
    end
  end
end
