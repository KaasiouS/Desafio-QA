Dado('Acesso o endereço para consultar restrições de um CPF com restrição') do
    CPFComRestricao = HTTParty.get("http://localhost:8080/api/v1/restricoes/97093236014")
end

Então('Recebo a mensagem que o CPF está com restrição e o código {int}') do |int|
    log CPFComRestricao.body
    log CPFComRestricao.code
    expect(CPFComRestricao.code).to eq 200
end

Dado('Acesso o endereço para consultar restrições de um CPF sem restrição') do
    CPFSemRestricao = HTTParty.get("http://localhost:8080/api/v1/restricoes/12345678910")
end
  
Então('Recebo a mensagem que o CPF está sem restrição e o código {int}') do |int|
    log CPFSemRestricao.body
    log CPFSemRestricao.code
    expect(CPFSemRestricao.code).to eq 204
end

Dado('Envio a requisição de consultar todas as simulações') do
    ConsultarTudo = HTTParty.get("http://localhost:8080/api/v1/simulacoes")
   end
  
  Então('Recebo o código {int}') do |int|
    log ConsultarTudo.code
    expect(ConsultarTudo.code).to eq 200
  end

  Dado('Envio uma requisicao get para consultar um CPF existente') do
    CPF_Ja_Existe = HTTParty.get("http://localhost:8080/api/v1/simulacoes/12345678910")
  end
  
  Então('Caso o CPF já exista na base de dados recebo o código {int} da API') do |int|
    log CPF_Ja_Existe.code
    expect(CPF_Ja_Existe.code).to eq 200
  end

  Dado('Envio uma requisição get de um CPF que não existe na base de dados.') do
    CPF_NAO_Existe = HTTParty.get("http://localhost:8080/api/v1/simulacoes/00000000000")
  end
  
  Então('A API me devolve o código {int} informando que o CPF não foi encontrado.') do |int|
    log CPF_NAO_Existe.body
    log CPF_NAO_Existe.code
    expect(CPF_NAO_Existe.code).to eq 404
  end