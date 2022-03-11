#!/bin/sh

desiredVersion="$1"
echo "desired nancy version: ${desiredVersion}"
if [ -z "$desiredVersion" ]; then
  >&2 echo "must specify a desiredVersion, like: latest or v1.0.15"
  exit 1
elif [[ ${desiredVersion} == "latest" ]]; then
  latest_version_is=$(curl --fail -s https://api.github.com/repos/sonatype-nexus-community/nancy/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')
  desiredVersion=${latest_version_is}
elif [[ ${desiredVersion:0:1} != "v" ]]; then
  >&2 echo "specific nancy version (${desiredVersion}) must start with v, like: v1.0.15"
  exit 1
fi
# installer filename excludes v from version
sourceUrl="https://github.com/sonatype-nexus-community/nancy/releases/download/${desiredVersion}/nancy_${desiredVersion:1}_linux_amd64.apk"
echo "installing nancy via ${sourceUrl}"
curl --fail -L -o nancy.apk ${sourceUrl}
apk add --no-progress --quiet --no-cache --allow-untrusted nancy.apk
