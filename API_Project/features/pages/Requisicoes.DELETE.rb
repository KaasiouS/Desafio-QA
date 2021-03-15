Dado('Envio uma requisição de Delete pelo ID') do

  def return_greatest_id()
    response = HTTParty.get('http://localhost:8080/api/v1/simulacoes')
    return response.parsed_response.map{ |item| item["id"]}.max
end

@ID = return_greatest_id()

    Delete = HTTParty.delete("http://localhost:8080/api/v1/simulacoes/"+@ID.to_s)
end
  
Então('recebo Status code {int}') do |int|
    log Delete.code
    expect(Delete.code).to eq 200
end