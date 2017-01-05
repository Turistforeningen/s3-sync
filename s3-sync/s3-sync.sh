#!/usr/bin/env sh

# Source AWS S3 credentials
source /secrets/aws.env

echo "$(date): Running aws s3 sync"
aws s3 sync --delete --exclude="*" --include="backups/*" --acl="private" s3://turistforeningen s3://turistforeningen-dev
aws s3 sync --delete --exclude="backups/*" --acl="public-read" s3://turistforeningen s3://turistforeningen-dev
STATUS_CODE=$?
echo "$(date): aws s3 sync exited with status code ${STATUS_CODE}"
