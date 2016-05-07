# infra

## nginx

Start nginx with the 3 env variables :

 - ```DOMAIN```: base domain to serve (contains auth.DOMAIN and *.DOMAIN for conference)
 - ```AUTH_URL```: auth app url (ex: http://auth:8080)
 - ```CFP_URL```: cfp app url (ex: http://cfp:8080)
 
The nginx conf redirect users to HTTPS site, you must mount the volume ```/etc/ssl/cfpio/``` containing two files :

 - ```cfpio.crt```: Certificate file (PEM format)
 - ```cfpio.key```: Private key file (PEM format)
 
To convert the PKCS12 certificate in right format, you can run the following commands:

```
openssl pkcs12 -in certificate.pfx -nocerts -nodes -out keyfile-encrypted.key
openssl rsa -in keyfile-encrypted.key -out cfpio.key
openssl pkcs12 -in certificate.pfx -clcerts -nokeys -out certificate.crt
openssl pkcs12 -in certificate.pfx -out domain-ca.crt -nodes -nokeys -cacerts
cat certificate.crt domain-ca.crt > cfpio.crt
rm keyfile-encrypted.key certificate.crt domain-ca.crt
```