# docker-billing
Allows for the download and ingest of a detailled billing report from AWS into elasticsearch. 
updated for es7

### Usage:
Run the container and ingest a report to a local ELK stack
```docker run --env-file ./env.file --net elasticsearch_esnet --rm -it sot001/docker-billing:latest```

#### Env File parameters
```
AWS_SECRET_ACCESS_KEY='secretKeyHere'
AWS_ACCESS_KEY_ID='secretKeyIDHere'
AWS_REGION='aws region here'
BUCKET='the bucket where your detailled billing report sits'
ACCOUNT='your account number'
YEAR=YYYY
MONTH=MM
ES_HOST='host name of es cluster'
ES_PORT=es cluster port
```
