json.extract! despesa, :id, :deputado_id, :foranecedor, :cnpjCPF, :numero, :tipoDocumento, :dataEmissao, :valorDocumento, :valorGlosa, :valorLiquido, :mes, :ano, :ressarcimento, :restituicao, :idDocumento, :urlDocumento, :created_at, :updated_at
json.url despesa_url(despesa, format: :json)
