# ![Compass.Uol](https://blog-qa.compass.uol/wp-content/uploads/2021/09/avatar_user_1_1632859146-96x96.png) ![Robot Framework](https://robotframework.org/img/RF.svg)

# Desafio Final - RoboTron
Este repositório mostra a automação de testes da [API ServeRest](https://serverest.dev/) utilizando o framework [Robot](https://robotframework.org/).  
Os códigos desenvolvidos fazem parte do programa de bolsas da Compass.Uol, trilha de aprendizado Robotron.

## Mapa Mental da API ServeRest
<img width="504" alt="Mapa Mental" src="https://user-images.githubusercontent.com/76006992/188275751-305137c1-20eb-43ee-bf10-a8df12337f32.PNG">
Mapa mental desenvolvido no XMind. O arquivo completo pode ser encontrado na pasta principal do repositório.

## Para testar os códigos :computer:
- Você deve ter o Python e o Robot instalados na sua máquina.
Caso ainda não tenha, [clique aqui para instruções de instalação.](https://github.com/robotframework/robotframework/blob/master/INSTALL.rst)

- Para clonar esse repositório, abra o Git Bash na pasta onde deseja que ele seja adicionado e execute seguinte comando:  
`$ git clone https://github.com/lauraghrk/RoboTron_LauraGehrke_DesafioFinal.git`
  
- Para iniciar a API localmente, abra o terminal de comando e execute: `npx serverest`  
  Mantenha esse terminal aberto durante toda a execução dos testes.

- Com o ambiente preparado, abra um novo terminal de comando e execute: `cd` + `caminho da pasta RoboTron_LauraGehrke_DesafioFinal`

- Uma vez dentro da pasta do projeto, escolha um dos comandos a seguir:

  -Executa todos os testes: `robot -d reports ./tests/`

  -Executa os testes do endpoint /login: `robot -d reports tests/login_tests.robot`

  -Executa os testes do endpoint /usuarios: `robot -d reports tests/usuarios_tests.robot`

  -Executa os testes do endpoint /produtos: `robot -d reports tests/produtos_tests.robot`

  -Executa os testes do endpoint /carrinhos: `robot -d reports tests/carrinhos_tests.robot`

  -Para executar um teste específico: `robot -d reports -i <tag_do_teste> tests/<arquivo_do_teste.robot>`

Os relatórios de resultado dos testes são encontrados na pasta Reports.

## Tecnologias utilizadas
* Python - versão: 3.8.2 
* Robot - versão: 5.0.1 
* VSCode - versão: 1.69
* Libraries - [RequestsLibrary](https://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html#library-documentation-top) - [Collections](https://robotframework.org/robotframework/latest/libraries/Collections.html) - [OperatingSystem](https://robotframework.org/robotframework/5.0/libraries/OperatingSystem.html) - [FakerLibrary](https://guykisel.github.io/robotframework-faker/#Mac%20Processor)

## Créditos :handshake:
**Autora:** [Laura Gehrke](https://github.com/lauraghrk).  

**Colaboração:** Manoella, Mari, Paulo e Pedro (turma do programa de bolsas). Matheus e Demétrio (evangelistas da Compass).  

**Referências:**
- Material disponibilizado pela Compass.Uol;  
- Documentação da API ServeRest e das Libraries utilizadas.