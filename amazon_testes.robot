*** Settings ***
Documentation    Essa suite testa o site da amazon
Resource         amazon_resources.robot
Test Setup       Abrir o navegador

# Test Teardown    Fechar navegador


*** Test Cases ***

Caso de teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]  Esse teste veirifica o menu eletronicos da amazon.com.br
    ...              e verificaca a categoria de computadores e informatica
    [Tags]           menus  categorias
    Acessar a home page do site Amazon.com.br
    Entrar no menu "Eletrônicos"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a categoria "Computadores e Informática"

Caso de teste 02 - Pesquisa de um Produto
  [Documentation]  Esse teste verifica a busca de um produto
  [Tags]           busca_produtos  lista_busca
    Acessar a home page do site Amazon.com.br 
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar resultado da pesquisa, listando o produto pesquisado