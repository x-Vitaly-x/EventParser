module EventInfos
  class CoBerlinEvent < EventInfo
    def self.sync
      Parsers::CoBerlinParser.get_newest_data.each do |data|
        self.create_new_event!(self, data.with_indifferent_access)
      end
    end
  end
end
