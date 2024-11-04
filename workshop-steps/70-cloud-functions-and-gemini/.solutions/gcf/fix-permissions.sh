#!/bin/bash

set -euo pipefail

source ../.env ||  fatal 2

# This I created manually.
# The SA is the Compute Service account.
gcloud --project "$PROJECT_ID" functions add-invoker-policy-binding \
    php_amarcord_generate_caption \
    --region="$GCP_REGION" \
    --member="serviceAccount:$PROJECT_NUMBER-compute@developer.gserviceaccount.com"
