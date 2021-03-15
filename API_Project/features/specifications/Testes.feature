#language: pt

Funcionalidade: Testes de API
Como Analista de QA
Eu quero realizar as requisições da API testadas.
A fim de garantir a qualidade do software testado.

@Get 
Cenário: Consultar CPF com restrição
    Dado Acesso o endereço para consultar restrições de um CPF com restrição
    Então Recebo a mensagem que o CPF está com restrição e o código 200
    # Há um issue aqui, deveria ser retornado a mensagem "O CPF 99999999999 possui restrição"
    # Escrevi o script pois, é simples de realizar a manutenção após o fixed, logo na regressão já estará pronto.

Cenário: Consultar CPF Sem restrição
    Dado Acesso o endereço para consultar restrições de um CPF sem restrição
    Então Recebo a mensagem que o CPF está sem restrição e o código 204

Cenário: Inserir uma nova simulação com sucesso.
    Dado Acesso o endereço para consultar restrições de um CPF sem restrição
    Quando submeto uma requisição com cadastro de CPF sem restrição
    Então a simulação é cadastrada com sucesso e recebo o código 201 e os dados cadastrados. 

Cenário: Inserir uma nova simuação com problema em alguma regra
    Dado Acesso o endereço para consultar restrições de um CPF sem restrição
    Quando submeto uma requisição com cadastro com problema
    Então Recebo o código 400 com a lista de erros.

Cenário: Consultar todas as simulações cadastradas
    Dado Envio a requisição de consultar todas as simulações
    Então Recebo o código 200
    #E Retorna o código 204 se não existir simulações cadastradas

Cenário: Consultar uma simulacao via CPF existente
    Dado Envio uma requisicao get para consultar um CPF existente
    Então Caso o CPF já exista na base de dados recebo o código 200 da API

Cenário: Consultar uma simulação via CPF que não existe
    Dado Envio uma requisição get de um CPF que não existe na base de dados.
    Então A API me devolve o código 404 informando que o CPF não foi encontrado.

Cenário: Alterar uma simulação já existente através do CPF
    Dado Envio uma requisição de alteração
    Então recebo o código 200 ao efetuar com sucesso a operação e os dados alterados.

Cenário: Remover uma Simulação
    Dado Envio uma requisição de Delete pelo ID
    Então recebo Status code 200

