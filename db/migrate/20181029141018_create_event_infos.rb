class CreateEventInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :event_infos do |t|
      t.string :title
      t.string :subtitle
      t.text :content
      t.datetime :event_start
      t.datetime :event_end
      t.string :url
      t.string :type

      t.timestamps
    end
  end
end
