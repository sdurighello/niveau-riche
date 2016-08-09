require 'test_helper'

class SubmarinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @submarine = submarines(:one)
  end

  test "should get index" do
    get submarines_url
    assert_response :success
  end

  test "should get new" do
    get new_submarine_url
    assert_response :success
  end

  test "should create submarine" do
    assert_difference('Submarine.count') do
      post submarines_url, params: { submarine: { description: @submarine.description, image_url: @submarine.image_url, max_number_of_guests: @submarine.max_number_of_guests, name: @submarine.name, port_id: @submarine.port_id, price_day: @submarine.price_day, type_submarine: @submarine.type_submarine } }
    end

    assert_redirected_to submarine_url(Submarine.last)
  end

  test "should show submarine" do
    get submarine_url(@submarine)
    assert_response :success
  end

  test "should get edit" do
    get edit_submarine_url(@submarine)
    assert_response :success
  end

  test "should update submarine" do
    patch submarine_url(@submarine), params: { submarine: { description: @submarine.description, image_url: @submarine.image_url, max_number_of_guests: @submarine.max_number_of_guests, name: @submarine.name, port_id: @submarine.port_id, price_day: @submarine.price_day, type_submarine: @submarine.type_submarine } }
    assert_redirected_to submarine_url(@submarine)
  end

  test "should destroy submarine" do
    assert_difference('Submarine.count', -1) do
      delete submarine_url(@submarine)
    end

    assert_redirected_to submarines_url
  end
end
