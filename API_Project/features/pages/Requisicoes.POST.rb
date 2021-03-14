Dado('Crio uma simulação com o CPF {int}.') do |int|
  @body = {
    "nome": Faker::Name.name,
    "cpf": 12345678910,
    "email": Faker::Internet.email,
    "valor": Faker::Number.between(from: 1000, to: 40000),
    "parcelas": Faker::Number.between(from: 2, to: 48),
    "seguro": true
  }.to_json

    CPF_Unico_ID13 = HTTParty.post("http://localhost:8080/api/v1/simulacoes",
        :body => @body,
        :headers => {"Content-Type" => 'application/json'})
  end
  
  Então('Armazeno o ID em uma variável global para chamar o método DELETE ao fim da suite de testes.') do
    log CPF_Unico_ID13.body
    log CPF_Unico_ID13.code
    #expect(CPF_Unico_ID13.code).to eq 201
    #Refatorar isso aqui pra lincar com o método delete
    #if (expect(CPF_Unico_ID13.code).to eq 201) {
      #log "CPF Criado com sucesso"
      #} else {(expect(CPF_Unico_ID13.code).to eq 209)
        
    #}

  end



Quando('submeto uma requisição com cadastro de CPF sem restrição') do
    @body = {
        "nome": Faker::Name.name,
        "cpf": Faker::Number.number(digits: 11),
        "email": Faker::Internet.email,
        "valor": Faker::Number.between(from: 1000, to: 40000),
        "parcelas": Faker::Number.between(from: 2, to: 48),
        "seguro": true
      }.to_json

        SimulacaoBoa = HTTParty.post("http://localhost:8080/api/v1/simulacoes",
            :body => @body,
            :headers => {"Content-Type" => 'application/json'})

end
  
Então('a simulação é cadastrada com sucesso e recebo o código {int} e os dados cadastrados.') do |int|
    log SimulacaoBoa.body
    log SimulacaoBoa.code
    expect(SimulacaoBoa.code).to eq 201
end

Quando('submeto uma requisição com cadastro com problema') do
    @body = {
        "nome": Faker::Name.name,
        "cpf": Faker::Number.number(digits: 11),
        "email": "",
        "valor": Faker::Number.between(from: 1000, to: 40000),
        "parcelas": Faker::Number.between(from: 2, to: 48),
        "seguro": true
      }.to_json

        SimulacaoFaltaInfoCadastro = HTTParty.post("http://localhost:8080/api/v1/simulacoes",
            :body => @body,
            :headers => {"Content-Type" => 'application/json'})
  end
  
  Então('Recebo o código {int} com a lista de erros.') do |int|
    log SimulacaoFaltaInfoCadastro.body
    log SimulacaoFaltaInfoCadastro.code
    expect(SimulacaoFaltaInfoCadastro.code).to eq 400
  end