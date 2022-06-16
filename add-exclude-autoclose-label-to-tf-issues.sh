#!/bin/bash
set -eu

ORG="quipper"
REPO="terraform"
NUM=$1

if [ $# -ne 1 ]; then
  echo "Usage: $0 <issue number>"
  exit 1
fi

# ref: https://docs.github.com/en/rest/issues/labels#add-labels-to-an-issue
curl \
  -X POST \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Authorization: token ${GITHUB_TOKEN}" \
  "https://api.github.com/repos/${ORG}/${REPO}/issues/${NUM}/labels" \
  -d '{"labels":["exclude-autoclose"]}'
