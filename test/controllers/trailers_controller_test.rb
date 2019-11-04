require 'test_helper'

class TrailersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get trailers_index_url
    assert_response :success
  end

end
