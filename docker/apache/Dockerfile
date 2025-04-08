ARG HTTPD_VERSION
FROM httpd:${HTTPD_VERSION}

RUN echo 'Include conf/extra/httpd-vhosts.conf' >> /usr/local/apache2/conf/httpd.conf
COPY ./httpd-vhosts.conf /usr/local/apache2/conf/extra/