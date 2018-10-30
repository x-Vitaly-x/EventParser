module EventInfos
  class GorkiEvent < EventInfo
    def self.sync
      Parsers::GorkiParser.get_newest_data.each do |data|
        self.create_new_event!(self, data.with_indifferent_access)
      end
    end
  end
end
