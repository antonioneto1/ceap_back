require "test_helper"

class DeputadosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @deputado = deputados(:one)
  end

  test "should get index" do
    get deputados_url
    assert_response :success
  end

  test "should get new" do
    get new_deputado_url
    assert_response :success
  end

  test "should create deputado" do
    assert_difference('Deputado.count') do
      post deputados_url, params: { deputado: { codigoLegislatura: @deputado.codigoLegislatura, cpf: @deputado.cpf, despesas_ids: @deputado.despesas_ids, idDeputado: @deputado.idDeputado, legislatura: @deputado.legislatura, nomeParlamentar: @deputado.nomeParlamentar, numeroCarteiraParlamentar: @deputado.numeroCarteiraParlamentar, numeroDeputadoID: @deputado.numeroDeputadoID, siglaPartido: @deputado.siglaPartido, siglaUF: @deputado.siglaUF, urlPhoto: @deputado.urlPhoto } }
    end

    assert_redirected_to deputado_url(Deputado.last)
  end

  test "should show deputado" do
    get deputado_url(@deputado)
    assert_response :success
  end

  test "should get edit" do
    get edit_deputado_url(@deputado)
    assert_response :success
  end

  test "should update deputado" do
    patch deputado_url(@deputado), params: { deputado: { codigoLegislatura: @deputado.codigoLegislatura, cpf: @deputado.cpf, despesas_ids: @deputado.despesas_ids, idDeputado: @deputado.idDeputado, legislatura: @deputado.legislatura, nomeParlamentar: @deputado.nomeParlamentar, numeroCarteiraParlamentar: @deputado.numeroCarteiraParlamentar, numeroDeputadoID: @deputado.numeroDeputadoID, siglaPartido: @deputado.siglaPartido, siglaUF: @deputado.siglaUF, urlPhoto: @deputado.urlPhoto } }
    assert_redirected_to deputado_url(@deputado)
  end

  test "should destroy deputado" do
    assert_difference('Deputado.count', -1) do
      delete deputado_url(@deputado)
    end

    assert_redirected_to deputados_url
  end
end
