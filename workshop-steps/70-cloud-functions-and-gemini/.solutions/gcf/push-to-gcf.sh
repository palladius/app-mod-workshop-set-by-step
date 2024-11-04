#!/bin/bash

set -euo pipefail

echo Sourcing .env locally..

# Do what you need to get ENV vars
# source .env ||  fatal 2

echo "Pushing ☁️ f(x)☁ to 🪣 $GS_BUCKET, along with DB config.. (DB_PASS=$DB_PASS)"

# Note. The source is '.'. You might have to adjust if you call the push script
#       from a different place
# Note. I've seen this script fail when $DB_PASS would have a number of non-alphabetical characters, like \ : ; and so on.
#       Consider minimizing them.
#
gcloud --project "$PROJECT_ID" functions deploy php_amarcord_generate_caption \
    --runtime python310 \
    --region "$GCP_REGION" \
    --trigger-event google.cloud.storage.object.v1.finalized \
    --trigger-resource "$BUCKET" \
    --set-env-vars "DB_HOST=$DB_HOST,DB_NAME=$DB_NAME,DB_PASS=$DB_PASS,DB_USER=$DB_USER" \
    --source . \
    --entry-point generate_caption \
    --gen2

# Memento!!!
# TODO(ricc): Still need to add bigger memory limits, like 512 RAM after this.
