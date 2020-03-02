#!/bin/bash
#Simple script to load ping fed audit template and kibana saved ndjson.

es_status="red"

while [ "$es_status" != "green" ]
do
  echo "Status Not Green Yet"
  sleep 3
  health=$(curl -u elastic:$ELASTIC_PASSWORD --insecure https://es01:9200/_cluster/health)
  es_status=$(expr "$health" : '.*"status":"\([^"]*\)"')
done

sleep 30 # Allow Some time For ElasticSearch Cluster to stabilize 
echo "Loading Templates"
curl -X PUT "https://es01:9200/_template/pf_audit?pretty" --insecure -u elastic:$ELASTIC_PASSWORD -H 'Content-Type: application/json' -d"@/usr/share/elasticsearch/config/es_config/pf_template.json"
curl -X PUT "https://es01:9200/_template/pf_audit?pretty" --insecure -u elastic:$ELASTIC_PASSWORD -H 'Content-Type: application/json' -d"@/usr/share/elasticsearch/config/es_config/pd_template.json"

echo "loading kibana saved objects"
curl -X POST "https://kibana:5601/api/saved_objects/_import" --insecure -u elastic:$ELASTIC_PASSWORD -H "kbn-xsrf: true" --form file="@/usr/share/elasticsearch/config/kibana_config/kib_base.ndjson"

