FROM nginx

COPY proxy_params /etc/nginx/
COPY ssl.conf /etc/nginx/conf.d/01-ssl.conf
COPY redirect_https.conf /etc/nginx/conf.d/02-redirect_https.conf
COPY gzip.conf /etc/nginx/conf.d/03-gzip.conf
COPY cfpio.conf /etc/nginx/conf.d/cfpio.template

VOLUME "/etc/ssl/cfpio/"

EXPOSE 80 443

ENV DOMAIN=test AUTH_URL=http://172.17.0.1:46001 CFP_URL=http://172.17.0.1:8080

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]