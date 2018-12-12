# docker-billing
Allows for the download and ingest of a detailled billing report from AWS into elasticsearch. 

### Usage:
Run the container and ingest a report to a local ELK stack
```docker run --env-file ./env.file --net elasticsearch_esnet --rm -it sot001/docker-billing:latest```
