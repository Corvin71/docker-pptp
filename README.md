# PPTP (VPN) for Docker
This is a docker image for a simple PPTP server. The server uses chap-secrets authentification.

The PPTP server is configure to use the */etc/ppp/chap-secrets* file to authenticate VPN clients. You need to provide this file when you start the container.

Exemple of *chap-secrets* file :

````
# Secrets for authentication using CHAP
# client server secret IP addresses
user * Passw0rd *
````

## Running PPTP server
To start the PPTP server as a docker container, run the following command :

````
docker run --name pptpd --privileged -d -v <path_to_chap-secrets>:/etc/ppp/chap-secrets -p 1723:1723  kevinpz/docker-pptp
````

