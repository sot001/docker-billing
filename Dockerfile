FROM sot001/awscli:latest


RUN git clone https://github.com/sot001/aws-detailed-billing-parser.git /app/aws-detailed-billing-parser

WORKDIR /app/aws-detailed-billing-parser

RUN python /app/aws-detailed-billing-parser/setup.py install

COPY ./ingest-billing-data.sh /

ENTRYPOINT ["/ingest-billing-data.sh"]
