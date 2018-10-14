require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'should get index if online' do
    user = build(:user)
    sign_in user

    get images_index_url
    assert_response :success
  end

  test 'should see nothing if offline' do
    get images_index_url
    assert_response :redirect
  end


end
