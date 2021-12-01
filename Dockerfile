#############
FROM debian
############

### INSTALA APACHE CURL PHP MODSEC ###
########################################
RUN apt-get update && apt-get install -y apache2 curl php libxml2-dev libcurl4-gnutls-dev liblua5.1-0 liblua5.1-0-dev build-essential libghc-pcre-light-dev zip libapache2-mod-security2 libxml2 libxml2-dev libxml2-utils libaprutil1 libaprutil1-dev  && apt-get clean
RUN chown www-data:www-data /var/lock/ && chown www-data:www-data /var/run/ && chown www-data:www-data /var/log/
RUN mkdir /etc/modsecurity/regras
########################################

### SOBE ARQUIVO DE CONFIGURAÇÃO ###
ADD modsecurity.conf /etc/modsecurity
#####################################

### SOBE AS REGRAS CUSTOM ###
ADD regras/minharegra.conf /etc/modsecurity/regras/
#####################################

### SOBE OS WEBSHELLS
ADD WEBSHELLS/* /var/www/html/
#######################################
ENV APACHE_LOCK_DIR="/var/lock"
ENV APACHE_PID_FILE="/var/run/apache2.pid"
ENV APACHE_RUN_USER="www-data"
ENV APACHE_RUN_GROUP="www-data"
ENV APACHE_LOG_DIR="/var/log/apache2"
########################################

########################################
ADD index.html /var/www/html/
########################################

########################################
HEALTHCHECK --interval=5m --timeout=3s \
CMD curl http://localhost/ || exit 1
########################################

########################################
USER root
########################################

########################################
WORKDIR /var/www/html
########################################

########################################
LABEL description="ModSec"
LABEL version="0.1"
########################################

########################################
VOLUME /var/www/html/
########################################

########################################
EXPOSE 80
########################################

########################################
ENTRYPOINT ["/usr/sbin/apachectl"]
########################################

########################################
CMD ["-D", "FOREGROUND"]
########################################
