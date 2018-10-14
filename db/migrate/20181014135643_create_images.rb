class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :name
      t.integer :user_id
      t.string :type

      t.timestamps
    end
    add_attachment :images, :image_file
  end
end
