class EventInfo < ApplicationRecord
  validates_presence_of :title, :url, :subtitle
  validates_uniqueness_of :url

  def self.sync
    EventInfos::CoBerlinEvent.sync
    EventInfos::GorkiEvent.sync
  end

  def self.create_new_event!(event_class, data)
    event_class.create_with(data).find_or_create_by(url: data['url'])
  end

  def self.search(type, date, title)
    t = self.arel_table
    hashes = []
    if type.present?
      hashes << t[:type].eq(type)
    end
    if date.present?
      time = Time.strptime(date, '%Y-%m-%d')
      hashes << t[:event_start].between(time.beginning_of_day..time.end_of_day)
    end
    if title.present?
      hashes << t[:title].matches("%#{title.to_s}%")
    end
    res = self
    hashes.each do |hash|
      res = res.where(hash)
    end
    return res.order('event_start desc')
  end
end
