#  Dado('Envio uma requisição de Delete pelo ID') do
#    Delete = HTTParty.delete("http://localhost:8080/api/v1/simulacoes/12345678910/api/v1/simulacoes/11")
  #end
  
  #Então('recebo Status code {int}') do |int|
    #log Delete.code
    #expect(Delete.code).to eq 200
  #end