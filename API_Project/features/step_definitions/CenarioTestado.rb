  #Script Desativado devido um issue
  #Dado('e o CPF já está cadastrado') do
    #@body = {
        #"nome": "Fulano de Tal",
        #"cpf": 12345678910,
        #"email": "email@email.com",
        #"valor": 1200,
        #"parcelas": 3,
        #"seguro": true
      #}.to_json

        #SimulacaoComCPFDuplicado = HTTParty.post("http://localhost:8080/api/v1/simulacoes",
            #:body => @body,
            #:headers => {"Content-Type" => 'application/json'})
  #end
  
  #Então('Recebo o código {int} com a mensagem {string}') do |int, string|
    #log SimulacaoComCPFDuplicado.body
    #log SimulacaoComCPFDuplicado.code
    #expect(SimulacaoComCPFDuplicado.code).to eq 409
  #end

  

  
