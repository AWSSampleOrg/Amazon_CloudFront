# Trouble shooting

## Check if domain has valid SSL certificate

Origin's SSL certificate has to meet one of the following criteria.

- Origin domain name in `Common name` or `Subject Alternative Names`
- Viewer host header's domain name which is transferred to the origin of CloudFront distribution.

```sh
DOMAIN=""
SERVER_DOMAIN=""
openssl s_client -connect $DOMAIN:443 -servername $SERVER_DOMAIN | openssl x509 -text | grep -E '(CN|Alternative)' -A 2
```

- Check if the origin's certificate is expired.

Make sure current date time is between `Not Before` and `Not After`

```sh
openssl s_client -connect $DOMAIN:443 -servername $SERVER_DOMAIN | openssl x509 -text | grep Validity -A 3
```

-

```sh
openssl s_client -showcerts -connect $DOMAIN:443 -servername $SERVER_DOMAIN
```
