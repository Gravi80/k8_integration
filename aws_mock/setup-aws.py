#!/usr/bin/env python
import os
import time


# Seed AWS S3 buckets
SEED_DATA_DIR="/aws/s3/seed-data"
ASW_URL="http://localstack:4566"

time.sleep(10)
for bucket in os.listdir(SEED_DATA_DIR):
	if os.path.isdir(os.path.join(SEED_DATA_DIR, bucket)):
		print("Creating bucket {0}".format(bucket))
		os.system("aws --endpoint-url={s3_url} s3 mb s3://{bucket_name}".format(
			s3_url=ASW_URL,bucket_name=bucket))
		
		os.system("aws --endpoint-url={s3_url} s3 cp {seed_dir}/{bucket_name} s3://{bucket_name} --recursive".format(
			s3_url=ASW_URL,bucket_name=bucket,seed_dir=SEED_DATA_DIR))

print("AWS S3 buckets seed completed")
