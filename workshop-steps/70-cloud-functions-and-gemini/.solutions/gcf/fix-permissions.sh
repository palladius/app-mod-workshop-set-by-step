#!/bin/bash

set -euo pipefail

source ../.env ||  fatal 2

# This I created manually.
# The SA is the Compute Service account.
gcloud --project "$PROJECT_ID" functions add-invoker-policy-binding \
    php_amarcord_generate_caption_manhouse \
    --region="$GCP_REGION" \
    --member="serviceAccount:839850161816-compute@developer.gserviceaccount.com"
