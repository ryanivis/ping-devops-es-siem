#!/bin/bash
#
# !!!! ENDLESS LOOP
# THIS WILL PULL THREAT INTEL EVERY 2000 SECONDS AND PLACE IN THE ENRICHMENT CACHE FOLDER
#

echo "starting and running enrichment process"

while [ 1 -eq 1 ]
do
  echo "Starting enrichment pull..."
  python /usr/share/elasticsearch/config/bootstrap/enrichment.py
  sleep 2000
done