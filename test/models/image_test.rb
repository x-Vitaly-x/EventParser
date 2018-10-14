require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  test 'has original url and thumb url' do
    user = create(:user)
    image = create(:image, user_id: user.id)

    assert_not_nil image.url_original
    assert_not_nil image.url_thumbnail
  end
end
