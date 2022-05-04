require "application_system_test_case"

class DeputadosTest < ApplicationSystemTestCase
  setup do
    @deputado = deputados(:one)
  end

  test "visiting the index" do
    visit deputados_url
    assert_selector "h1", text: "Deputados"
  end

  test "creating a Deputado" do
    visit deputados_url
    click_on "New Deputado"

    fill_in "Codigolegislatura", with: @deputado.codigoLegislatura
    fill_in "Cpf", with: @deputado.cpf
    fill_in "Despesas ids", with: @deputado.despesas_ids
    fill_in "Iddeputado", with: @deputado.idDeputado
    fill_in "Legislatura", with: @deputado.legislatura
    fill_in "Nomeparlamentar", with: @deputado.nomeParlamentar
    fill_in "Numerocarteiraparlamentar", with: @deputado.numeroCarteiraParlamentar
    fill_in "Numerodeputadoid", with: @deputado.numeroDeputadoID
    fill_in "Siglapartido", with: @deputado.siglaPartido
    fill_in "Siglauf", with: @deputado.siglaUF
    fill_in "Urlphoto", with: @deputado.urlPhoto
    click_on "Create Deputado"

    assert_text "Deputado was successfully created"
    click_on "Back"
  end

  test "updating a Deputado" do
    visit deputados_url
    click_on "Edit", match: :first

    fill_in "Codigolegislatura", with: @deputado.codigoLegislatura
    fill_in "Cpf", with: @deputado.cpf
    fill_in "Despesas ids", with: @deputado.despesas_ids
    fill_in "Iddeputado", with: @deputado.idDeputado
    fill_in "Legislatura", with: @deputado.legislatura
    fill_in "Nomeparlamentar", with: @deputado.nomeParlamentar
    fill_in "Numerocarteiraparlamentar", with: @deputado.numeroCarteiraParlamentar
    fill_in "Numerodeputadoid", with: @deputado.numeroDeputadoID
    fill_in "Siglapartido", with: @deputado.siglaPartido
    fill_in "Siglauf", with: @deputado.siglaUF
    fill_in "Urlphoto", with: @deputado.urlPhoto
    click_on "Update Deputado"

    assert_text "Deputado was successfully updated"
    click_on "Back"
  end

  test "destroying a Deputado" do
    visit deputados_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Deputado was successfully destroyed"
  end
end
