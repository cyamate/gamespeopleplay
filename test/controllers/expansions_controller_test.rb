require 'test_helper'

class ExpansionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @expansion = expansions(:one)
  end

  test "should get index" do
    get expansions_url
    assert_response :success
  end

  test "should get new" do
    get new_expansion_url
    assert_response :success
  end

  test "should create expansion" do
    assert_difference('Expansion.count') do
      post expansions_url, params: { expansion: { designer_id: @expansion.designer_id, game_id: @expansion.game_id, name: @expansion.name, pcount: @expansion.pcount, publisher_id: @expansion.publisher_id, year: @expansion.year } }
    end

    assert_redirected_to expansion_url(Expansion.last)
  end

  test "should show expansion" do
    get expansion_url(@expansion)
    assert_response :success
  end

  test "should get edit" do
    get edit_expansion_url(@expansion)
    assert_response :success
  end

  test "should update expansion" do
    patch expansion_url(@expansion), params: { expansion: { designer_id: @expansion.designer_id, game_id: @expansion.game_id, name: @expansion.name, pcount: @expansion.pcount, publisher_id: @expansion.publisher_id, year: @expansion.year } }
    assert_redirected_to expansion_url(@expansion)
  end

  test "should destroy expansion" do
    assert_difference('Expansion.count', -1) do
      delete expansion_url(@expansion)
    end

    assert_redirected_to expansions_url
  end
end
