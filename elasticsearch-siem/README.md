### Important Folder Structure Notes
- `cert_config/` Contains bootstraping files for cert generation for ElasticSearch to use TLS between nodes (and kibana front end).
- `elasticsearch_config` Contains Enrichment Python to pull 2 opensource feeds into Logstash for Enrichment (TOR and Alien Vault Open Source Feeds)
- `enrichment_cache` Is preloaded with yaml as it needs to be present for logstash to start, they are updated every 2000 seconds
- `kibana_config` Stores an NDJSON file with all saved dashboard objects etc, and index mappings.
- `logstash` Stores the main pipeline for injesting logs from Ping Products
- `ping_siem_config_bootstrap` Contains Scrpt files for dependency install, enrichment file collection and parsing, and template loader for PF index

