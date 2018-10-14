require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  # tests if the application starts at all
  test 'should get index if user offline' do
    get root_path
    assert_response :success
  end

  # tests if application starts if user is signed in
  test 'should be redirected to images if online' do
    user = build_stubbed(:user)
    sign_in user

    get root_path
    assert_response :found
  end
end
