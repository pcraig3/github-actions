#!/bin/bash
set -e
export AZURE_HTTP_USER_AGENT="GITHUBACTIONS_${GITHUB_ACTION_NAME}_${GITHUB_REPOSITORY}"

if [[ -n "$AZURE_SERVICE_APP_ID" ]] && [[ -n "$AZURE_SERVICE_PASSWORD" ]]
then
  az container create --resource-group az-next-rg --name az-next --image "$ACR_LOGIN_SERVER"/az-next --registry-login-server "$ACR_LOGIN_SERVER" --registry-username "$AZURE_SERVICE_APP_ID" --registry-password "$AZURE_SERVICE_PASSWORD" --dns-name-label az-next-demo
else
  echo "One of the required parameters is not set: AZURE_SERVICE_APP_ID, AZURE_SERVICE_PASSWORD, AZURE_SERVICE_TENANT." >&2
  exit 1
fi
