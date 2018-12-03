built a python-base
built an awscli base from python base
built the billing base from the above
passing aws varibles in and running almost  works however need to push more debug in as its failing
also need to see how to connect to local elasticsearch container. may also be from localhost

### Usage:
Run the container and ingest a report to a local ELK stack
```docker run --env-file ./env.file --net elasticsearch_esnet -it billing:latest```
