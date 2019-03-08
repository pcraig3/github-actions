#!/bin/bash
set -e
export AZURE_HTTP_USER_AGENT="GITHUBACTIONS_${GITHUB_ACTION_NAME}_${GITHUB_REPOSITORY}"

echo $GITHUB_SHA;
echo ${GITHUB_SHA};
echo $IMAGE_SHA;
echo ${IMAGE_SHA};

echo 'mystring' |cut -c1-7;
echo $GITHUB_SHA | cut -c1-7;
echo ${GITHUB_SHA} | cut -c1-7;

echo ${IMAGE_SHA};
echo /github/home/.profile/${IMAGE_SHA};
