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
# with body but it doesn't work now. body include newline...
#FORMAT='{ "commit_id": "%H", "author": {"author_name": "%an", "author_email": "%ae"},  "committer": {"committer_name": "%cn", "committer_email": "ce"}, "date": "%ad", "subject": "%f" , "body": "%b"}'
FORMAT='{ "commit_id": "%H", "author_name": "%an", "author_email": "%ae", "committer_name": "%cn", "committer_email": "%ce", "date": "%ad", "subject": "%f" }'

git --git-dir $DIR/.git log --date=short \
    --pretty=format:"$FORMAT"
