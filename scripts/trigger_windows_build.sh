#!/bin/bash

_token=$1
_commit=$2
_buildType=$3


  "commitId": "${_commit}",
#

post_data=$(cat <<EOF
{
  "accountName": "Torkeldegaard",
  "projectSlug": "grafana",
  "branch": "windows_build",
  "environmentVariables": {
    "buildType": "${_buildType}"
  }
}
EOF
)

echo ${post_data}

curl \
--verbose \
--header "Accept: application/json" \
--header "Content-Type: application/json" \
--header "Authorization: Bearer ${_token}" \
--data "${post_data}" \
--request POST https://ci.appveyor.com/api/builds
