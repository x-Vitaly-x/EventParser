require 'test_helper'

class Api::ImagesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'get images' do
    user = create(:user)
    image = create(:image, user_id: user.id)
    sign_in user

    get api_images_path
    id = JSON.parse(@response.body).first['id']
    assert_not_nil id
    assert_equal id, image.id
  end

  test 'post new image' do
    user = create(:user)
    sign_in user

    post api_images_path, params: {
        image: {
            image_file: Rack::Test::UploadedFile.new(
                File.join(Rails.root, 'test', 'test.jpg'), 'image/jpeg')
        }
    }

    assert_equal JSON.parse(@response.body)['id'], user.images.first.id
  end

  test 'destroy image' do
    user = create(:user)
    image = create(:image, user_id: user.id)
    sign_in user

    assert_difference('Image.count', -1) do
      delete api_image_path(image.id)
    end
  end

end
