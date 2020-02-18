#!/bin/bash

#Simple script to load ping fed audit template and kibana saved ndjson

es_status="red"

while [ "$es_status" != "green" ]
do
  echo "Status Not Green Yet"
  sleep 3
  health=$(curl -u elastic:2FederateM0re --insecure https://es01:9200/_cluster/health)
  es_status=$(expr "$health" : '.*"status":"\([^"]*\)"')
done

sleep 120
echo "loading templates"
curl -X PUT "https://es01:9200/_template/pf_audit?pretty" --insecure -u elastic:2FederateM0re -H 'Content-Type: application/json' -d"@/usr/share/elasticsearch/config/es_config/templates.json"
echo "loading kibana saved objects"
curl -X POST "https://kibana:5601/api/saved_objects/_import" --insecure -u elastic:2FederateM0re -H "kbn-xsrf: true" --form file="@/usr/share/elasticsearch/config/kibana_config/kib_base.ndjson"

echo "starting and running enrichment process"

while [ 1 -eq 1 ]
do
  echo "Starting enrichment pull..."
  python /usr/share/elasticsearch/config/bootstrap/enrichment.py
  sleep 2000
done



