# MeuModSec


# OBJETIVO: #

- TER UMA IMAGEM DE MODSEC + APACHE + PHP 
- LIBERDADE PARA CRIAÇÃO DE REGRAS E TESTES RAPIDOS
- COLOCAR EM PRATICA O QUE FOI APRENDIDO NO CURSO DESCOMPLICANDO O DOCKER
- COLOCAR EM PRATICA O QUE FOI APRENDIDO NO CURSO GIT COMPLETO: DO BASICO AO AVANÇADO


# Onde colocar minhas regras do ModSec Personalizadas ? #

- Crie sua regra dentro da pasta MeuModSec/regras


# Onde colocar meus webshells #

- Coloque o Webshell dentro de MeuModSec/webshells todos serão copiados para /var/www/html/ do container Docker


# Como subir essa bagaça ? #

- Realizar o famoso git clone https://github.com/felipe8398/MeuModSec.git
- Ter instalado o idolatrado e sensacional Docker
- Realizar o build da imagem, exemplo: docker image build -t meumodsec:0.1 .
- Subir o container, exemplo: docker container run -d -p80:80 meumodsec:0.1
- Ser feliz  \\**/





