openssl req -subj '/CN=keycloak-rhbk.apps.cluster-vqgg6.dynamic.opentlc.com/O=Test Keycloak./C=US' -newkey rsa:2048 -nodes -keyout key.pem -x509 -days 365 -out certificate.pem
oc create secret tls example-tls-secret --cert certificate.pem --key key.pem
oc create secret generic keycloak-db-secret \
  --from-literal=username=postgres \
  --from-literal=password=testpassword