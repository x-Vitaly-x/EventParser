class Image < ApplicationRecord
  has_attached_file :image_file,
                    styles: {
                        thumb: '100x100>',
                        square: '200x200#',
                        medium: '300x300>'
                    },
                    s3_permissions: :private

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image_file, :content_type => /\Aimage\/.*\Z/
  validates_presence_of :user_id

  belongs_to :user

  #
  # Url methods for generating signed AWS urls
  # #
  def url_thumbnail
    self.image_file.expiring_url(10, :square)
  end

  def url_original
    self.image_file.expiring_url(10, :original)
  end
end
