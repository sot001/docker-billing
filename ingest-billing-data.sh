#!/bin/bash

# To use this script, please set the following enviroment variables;
# AWS_SECRET_ACCESS_KEY - AWS credentials
# AWS_ACCESS_KEY_ID - AWS credentials
# AWS_REGION - AWS credentials
# BUCKET - AWS bucket name. eg. s3://my.example.bucket
# ACCOUNT - AWS account number
# YEAR - Year of billing report to pull (defaults to this year)
# MONTH - Month of billing report to pull (defaults to this month)
# ES_HOST - Elasticearch host eg. elasticsearch.example.com
# ES_PORT - port of host.

LOCAL_FOLDER='./'
if [ ! $MONTH ];then
  MONTH=$(date +%m)
fi

if [ ! $YEAR ];then
  YEAR=$(date +%Y)
fi

DBR_FILE=$ACCOUNT-aws-billing-detailed-line-items-with-resources-and-tags-$YEAR-$MONTH.csv
ZIP_FILE=$DBR_FILE.zip

#Change to local working folder
cd $LOCAL_FOLDER

# Copy the file from bucket to local folder
aws --region $AWS_REGION s3 cp $BUCKET/$ZIP_FILE .

# Extract the ziped file
unzip -o  $ZIP_FILE

# Process the file with dbrparser
dbrparser -i $DBR_FILE -e $ES_HOST -p $ES_PORT -t 2 -bm 2 -y $YEAR -m $MONTH --delete-index -bi

echo Complete

