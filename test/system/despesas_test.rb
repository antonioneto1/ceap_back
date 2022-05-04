require "application_system_test_case"

class DespesasTest < ApplicationSystemTestCase
  setup do
    @despesa = despesas(:one)
  end

  test "visiting the index" do
    visit despesas_url
    assert_selector "h1", text: "Despesas"
  end

  test "creating a Despesa" do
    visit despesas_url
    click_on "New Despesa"

    fill_in "Ano", with: @despesa.ano
    fill_in "Cnpjcpf", with: @despesa.cnpjCPF
    fill_in "Dataemissao", with: @despesa.dataEmissao
    fill_in "Deputado", with: @despesa.deputado_id
    fill_in "Foranecedor", with: @despesa.foranecedor
    fill_in "Iddocumento", with: @despesa.idDocumento
    fill_in "Mes", with: @despesa.mes
    fill_in "Numero", with: @despesa.numero
    fill_in "Ressarcimento", with: @despesa.ressarcimento
    fill_in "Restituicao", with: @despesa.restituicao
    fill_in "Tipodocumento", with: @despesa.tipoDocumento
    fill_in "Urldocumento", with: @despesa.urlDocumento
    fill_in "Valordocumento", with: @despesa.valorDocumento
    fill_in "Valorglosa", with: @despesa.valorGlosa
    fill_in "Valorliquido", with: @despesa.valorLiquido
    click_on "Create Despesa"

    assert_text "Despesa was successfully created"
    click_on "Back"
  end

  test "updating a Despesa" do
    visit despesas_url
    click_on "Edit", match: :first

    fill_in "Ano", with: @despesa.ano
    fill_in "Cnpjcpf", with: @despesa.cnpjCPF
    fill_in "Dataemissao", with: @despesa.dataEmissao
    fill_in "Deputado", with: @despesa.deputado_id
    fill_in "Foranecedor", with: @despesa.foranecedor
    fill_in "Iddocumento", with: @despesa.idDocumento
    fill_in "Mes", with: @despesa.mes
    fill_in "Numero", with: @despesa.numero
    fill_in "Ressarcimento", with: @despesa.ressarcimento
    fill_in "Restituicao", with: @despesa.restituicao
    fill_in "Tipodocumento", with: @despesa.tipoDocumento
    fill_in "Urldocumento", with: @despesa.urlDocumento
    fill_in "Valordocumento", with: @despesa.valorDocumento
    fill_in "Valorglosa", with: @despesa.valorGlosa
    fill_in "Valorliquido", with: @despesa.valorLiquido
    click_on "Update Despesa"

    assert_text "Despesa was successfully updated"
    click_on "Back"
  end

  test "destroying a Despesa" do
    visit despesas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Despesa was successfully destroyed"
  end
end
