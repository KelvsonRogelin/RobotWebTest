*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${URL}    https://www.amazon.com.br/
${MENU_ELETRONICOS}     //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}    //h1[contains(.,'Eletrônicos e Tecnologia')]
${TEXTO_HEADER_ELETRONICOS}    Eletrônicos e Tecnologia
*** Keywords ***
Abrir o navegador    
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar navegador
    Close Browser

Acessar a home page do site Amazon.com.br 
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Wait Until Page Contains    text=${TEXTO_HEADER_ELETRONICOS}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}
    
Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "Computadores e Informática"
    Element Should Be Visible    locator=//img[@src='https://images-na.ssl-images-amazon.com/images/G/32/BR-hq/2021/img/Consumer_Electronics/Storefronts/Electronics/956.Storefront_categoria_computadores_icons_240x270.jpg']

Digitar o nome de produto "${PESQUISA_PRODUTO}" no campo de pesquisa
    Wait Until Element Is Visible    locator=//input[contains(@type,'text')]
    Click Element    locator=//input[contains(@type,'text')]
    Input Text    locator=//input[contains(@type,'text')]    text=${PESQUISA_PRODUTO}

Clicar no botão de pesquisa 
    Click Button    locator=//input[contains(@type,'submit')]
    
Verificar resultado da pesquisa, listando o produto pesquisado
    Wait Until Element Is Visible    locator=//img[contains(@alt,'Console Xbox Series S')]