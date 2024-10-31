#!/bin/bash

set -euo pipefail

#source .env
#source ~/git/app-mod-workshop-set-by-step/.env

. .env || exit 1

echo "Listing or Creating now bucket: $GS_BUCKET .."

gsutil ls "$GS_BUCKET/" ||
    gsutil mb -l "$GCP_REGION" -p "$PROJECT_ID" "$GS_BUCKET/"

# gsutil cp ./uploads/*.png "$GS_BUCKET/originals/"
# gsutil cp ./uploads/*.png "$GS_BUCKET/"
# gsutil cp ./uploads/*.jpg "$GS_BUCKET/"
gsutil cp ./uploads/*.{png,jpg} "$GS_BUCKET/"
# gsutil cp ./uploads/*.jpg "$GS_BUCKET/"

MOUNT_PATH='/var/www/html/uploads/'
# Riccardo test, not DEV not PROD..
# https://php-amarcord-bin-839850161816.europe-west8.run.app/login.php
SERVICE_NAME='php-amarcord-dev'
SERVICE_NAME_PROD='php-amarcord-prod'

echo "Now Patching cloud run '$SERVICE_NAME' with a succulent GCS mount to $GS_BUCKET.." \

gcloud --project "$PROJECT_ID" beta run services update "$SERVICE_NAME" \
    --region $GCP_REGION \
    --execution-environment gen2 \
    --add-volume=name=php_uploads,type=cloud-storage,bucket="$BUCKET"  \
    --add-volume-mount=volume=php_uploads,mount-path="$MOUNT_PATH"

# echo "Also Patching PROD cloud run '$SERVICE_NAME_PROD' with a succulent GCS mount to $GS_BUCKET.." \

# gcloud --project "$PROJECT_ID" beta run services update "$SERVICE_NAME_PROD" \
#     --region $GCP_REGION \
#     --execution-environment gen2 \
#     --add-volume=name=php_uploads,type=cloud-storage,bucket="$BUCKET"  \
#     --add-volume-mount=volume=php_uploads,mount-path="$MOUNT_PATH"
