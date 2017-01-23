require 'test_helper'

class AdventuresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @adventure = adventures(:one)
  end

  test "should get index" do
    get adventures_url
    assert_response :success
  end

  test "should get new" do
    get new_adventure_url
    assert_response :success
  end

  test "should create adventure" do
    assert_difference('Adventure.count') do
      post adventures_url, params: { adventure: { description: @adventure.description, location: @adventure.location, name: @adventure.name, picture: @adventure.picture, visit: @adventure.visit } }
    end

    assert_redirected_to adventure_url(Adventure.last)
  end

  test "should show adventure" do
    get adventure_url(@adventure)
    assert_response :success
  end

  test "should get edit" do
    get edit_adventure_url(@adventure)
    assert_response :success
  end

  test "should update adventure" do
    patch adventure_url(@adventure), params: { adventure: { description: @adventure.description, location: @adventure.location, name: @adventure.name, picture: @adventure.picture, visit: @adventure.visit } }
    assert_redirected_to adventure_url(@adventure)
  end

  test "should destroy adventure" do
    assert_difference('Adventure.count', -1) do
      delete adventure_url(@adventure)
    end

    assert_redirected_to adventures_url
  end
end
