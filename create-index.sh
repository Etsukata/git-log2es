#!/usr/bin/env bash

# output Elasticsearch bulk format of git log
# Usage:
#   ./create-index.sh <git-dir>

IDX_TYPE=$1
IDX_NAME=$2
ES_PATH=$3

IDX_STATUS=`curl -w"%{http_code}" -XHEAD $ES_PATH/$IDX_NAME 2>/dev/null`
if [ $IDX_STATUS != "200" ]; then
  curl -XPUT $ES_PATH/$IDX_NAME/ -d @gitlog_mapping_template.json
fi

