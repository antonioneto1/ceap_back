require "test_helper"

class CeapsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ceap = ceaps(:one)
  end

  test "should get index" do
    get ceaps_url
    assert_response :success
  end

  test "should get new" do
    get new_ceap_url
    assert_response :success
  end

  test "should create ceap" do
    assert_difference('Ceap.count') do
      post ceaps_url, params: { ceap: { deputados_ids: @ceap.deputados_ids, exercicio: @ceap.exercicio, total_gastos: @ceap.total_gastos } }
    end

    assert_redirected_to ceap_url(Ceap.last)
  end

  test "should show ceap" do
    get ceap_url(@ceap)
    assert_response :success
  end

  test "should get edit" do
    get edit_ceap_url(@ceap)
    assert_response :success
  end

  test "should update ceap" do
    patch ceap_url(@ceap), params: { ceap: { deputados_ids: @ceap.deputados_ids, exercicio: @ceap.exercicio, total_gastos: @ceap.total_gastos } }
    assert_redirected_to ceap_url(@ceap)
  end

  test "should destroy ceap" do
    assert_difference('Ceap.count', -1) do
      delete ceap_url(@ceap)
    end

    assert_redirected_to ceaps_url
  end
end
