Dado('Envio uma requisição de alteração') do
    @alterar = {
    "nome": Faker::Name.name,
    "cpf": 12345678910,
    "email": Faker::Internet.email,
    "valor": Faker::Number.between(from: 1000, to: 40000),
    "parcelas": Faker::Number.between(from: 2, to: 48),
    "seguro": true
  }.to_json

  AlterarCadastro = HTTParty.put("http://localhost:8080/api/v1/simulacoes/12345678910",
      :body => @alterar,
      :headers => {"Content-Type" => 'application/json'})
end

Então('recebo o código {int} ao efetuar com sucesso a operação e os dados alterados.') do |int|
log AlterarCadastro.body
log AlterarCadastro.code
expect(AlterarCadastro.code).to eq 200
end