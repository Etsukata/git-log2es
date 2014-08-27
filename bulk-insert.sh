#!/bin/sh

curl -s -XPOST http://localhost:9200/_bulk --data-binary @$1 ; echo
