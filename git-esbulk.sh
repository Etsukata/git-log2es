#!/usr/bin/env bash

# output Elasticsearch bulk format of git log
# Usage:
#   ./git-esbulk <git-dir>

if [ -z "$1" ]; then
    DIR="./"
else
    DIR=$1
fi

REPO=$(basename $(cd $DIR && pwd))
FORMAT='{ "index": { "_index": "oss", "_type" : "'$REPO'", "_id" : "%H" } }
{ "commit_id": "%H", "author": "%an <%ae>", "date": "%ad", "subject": "%f" }'

git --git-dir $DIR/.git log --date=short \
    --pretty=format:"$FORMAT"
