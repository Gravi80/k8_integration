#!/usr/bin/env sh
set -e

buckets=""
buckets="${buckets} bucket1"
buckets="${buckets} bucket2"

sleep 10;
for bucket in ${buckets}; do
	aws --endpoint-url=http://localstack:4566 s3 mb s3://$bucket
	if [ -d "/s3/seed-data/$bucket" ]; then
    aws --endpoint-url=http://localstack:4566 s3 cp /s3/seed-data/$bucket s3://$bucket --recursive
  fi
done

echo "Seed completed"
