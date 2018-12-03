FROM awscli:latest

WORKDIR /app

ADD ./aws-detailed-billing-parser /app
RUN chmod +x /app/setup.py
RUN python /app/setup.py install

ADD ingest-billing-data.sh /app
RUN chmod +x /app/ingest-billing-data.sh

CMD /app/ingest-billing-data.sh


