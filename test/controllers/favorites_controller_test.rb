require 'test_helper'

class FavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get favorites_new_url
    assert_response :success
  end

end
