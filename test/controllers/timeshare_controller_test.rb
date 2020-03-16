require 'test_helper'

class TimeshareControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get timeshare_index_url
    assert_response :success
  end

end
