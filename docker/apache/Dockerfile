ARG HTTPD_VERSION
FROM httpd:${HTTPD_VERSION}

RUN echo 'Include conf/extra/httpd-vhosts.conf' >> /usr/local/apache2/conf/httpd.conf
COPY ./httpd-vhosts.conf /usr/local/apache2/conf/extra/

COPY ./certs/server.crt /usr/local/apache2/conf/server.crt
COPY ./certs/server.key /usr/local/apache2/conf/server.key