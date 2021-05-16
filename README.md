**Automação Mobile do app Hews Hacker News (Login page)**


Este projeto tem como objetivo a automatização dos cenários de testes para a tela (alert) de login do app Hews Haker News. O app encontra se disponível na Play Store: https://play.google.com/store/apps/details?id=com.leavjenn.hews&hl=pt_BR&gl=US

___

**Estrutura do Projeto:**

Eu estou utilizando a seguinte estrutura para este projeto:

```
hews-hacker-news/
  resource/
      apk/
          hacker_news.apk
      steps/
          LoginResource.robot
      variables/
          Globais.robot
          MappingLogin.robot
  tests/
      LoginTest.robot

```

🗂 **Uma breve descrição das pastas do projeto:**

resource >> apk - Contém o arquivo apk do app hews-hacker-news.

resource >> steps - Contém os step's / keyword's dos casos de testes.

resource >>  variables - Variáveis globais e o mapping dos campos da tela do app que estão sendo utilizados nos casos de testes.

tests - Casos de testes descritos em linguagem natural semelhante ao BDD.
___

**Resources**

🎯  O que eu estou utilizando:

Robotframework<br>
AppiumLibrary<br>

🛠 Como instalar?

Observação: Python e pip deverão estar previamente instalados em sua máquina.

Execute o arquivo requirements.txt utilizando o seguinte comando no seu path:

```
pip install -r requirements
```
___

💻  **Configurar o ambiente de teste**

Execute o projeto utilizando o seguinte comando no seu terminal dentro da pasta "tests" do projeto:

```
robot -d ./logs LoginTest.robot
```
___

📝  **Reporte de Execução**

O robotframework cria automaticamente a pasta de logs com os arquivos log.html e report.html após a execução do projeto.

___
