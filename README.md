# Ping Stack with ElasticSearch SIEM
#### Built by Ryan Ivis with Ping Identity

The goal of this project is to have pre-built security dashboards to ride along side our products. The inital phase is currently working on PingFederate Audit Logs. 


## Status
| Phase    | Ping Product                             | Log Status  | Dashboard Status |
|----------|------------------------------------------|-------------|------------------|
| Phase 1  | Ping Federate Audit Logs                 | Complete    | Beta             |
| Phase 2  | Ping Directory Logs                      | In Progress | In Progress      |
| Phase 3  | Ping Access Logs                         | Future      | Future           |
| Phase 4  | Ping Data Console Logs                   | Future      | Future           |

## Important Note
- **THIS IS NOT INTENDED FOR PRODUCTION. THERE ARE DEFAULT PASSWORDS THAT MUST BE MODIFIED**...   
- **IF YOU MODIFY THE ELASTICSEARCH PASSWORD, YOU NEED TO UPDATE IT IN A FEW LOCATIONS** - will fix later...       
- **THERE ARE PERSISTANT DISKS USED FOR ES, AND ES CERTS TO CLEAR THEM WHEN YOU ARE DONE PLAYING**...   
	- `docker volume prune`  

## Dashboard Examples
------------
Demo Ping Fed Dashboard
![alt text](https://github.com/ryanivis/ping-devops-es-siem/blob/master/images/dashboard.png "PingFed Demo Dashboard")

 
- Threat Intel and TOR Endpoints are being provided by AlienVault and the TOR Network Endpoint List.  
- Threat Feeds are updated every 2000 seconds!!!


![alt text](https://github.com/ryanivis/ping-devops-es-siem/blob/master/images/Architecture.png "Architecture Overview")
------------

## Directions

- Clone this project to your local disk.  
- Create and place a file `.env` in root path of the clone and place these lines in it (update your devops details).      
------------
```
COMPOSE_PROJECT_NAME=es   
ELASTIC_VERSION=7.6.0   
ELASTIC_SECURITY=true    
ELASTIC_PASSWORD=2FederateM0re   
CERTS_DIR=/usr/share/elasticsearch/config/certificates     
PING_IDENTITY_DEVOPS_USER={YOUR DEVOPS USER NAME HERE}    
PING_IDENTITY_DEVOPS_KEY={YOUR DEVOPS KEY HERE}   
```
------------
- Configure Docker to have 8GB RAM and 4CPU  
	- Start the stack with `docker-compose up -d`  
	- Monitor the stack with `docker-compose logs --follow`  

------------

## Directions to change ELASTIC PASSWORD
- ** If updating the Elastic Password it must be updated in the following 3 locations or the stack will fail. **
	- ping-devops-es-siem/elasticsearch-siem/logstash/conf.d/logstash.conf 
	- ping-devops-es-siem/elasticsearch-siem/ping_siem_config_bootstrap/es_configurationloader.sh 
	- ping-devops-es-siem/.env

### Kibana Access
- ** WAIT UNTIL PING FED IS FULLY STARTED OR DASHBOARDS WILL NOT BE LOADED YET **
- Kibana listens on https://{IP}:5601
- UN is configured as "elastic"
- PASSWORD is configured as "2FederateM0re" 


### Important Notes <--READ
- Allow 5-10 min for the stack to come up!
- Do not access kibana until Ping Fed is loaded or you will find no dashboards / saved objects loaded.  
- ** If updating the Elastic Password it must also be updated in the logstash pipeline configuration **
	- ping-devops-es-siem/elasticsearch-siem/logstash/conf.d/logstash.conf 
	- ping-devops-es-siem/elasticsearch-siem/ping_siem_config_bootstrap/es_configurationloader.sh
	- ping-devops-es-siem/.env 
- This uses the default elastic user. This is bad practice and you should configure service users for logstash / kibana.
- Configure your local docker client with at least 8GB Ram and 4CPU.   

------------
## Kibana Saved Objects
- Saved Objects can be loaded by going to 'saved objects' under kibana settings and exporting all. Save the file in the...  
	- ./elasticsearch-siem/kibana_config/kib_base.ndjson  

- They will be reloaded upon Kibana Start!!! This enables you to save objects for dashboards and reload!

------------
## ElasticSearch Template for PF Audit Logs
- Elasticsearch will load the PF-Audit Template such that logs will have the correct field types for searching ONLY working for the AUDIT logs if you use the Included LOG4J format within this PF baseline.
- The Scripts will load this template once cluster state is green.
	- ./elasticsearch-siem/elasticsearch_config/templates.json

------------
## Logstash Pipeline
- TOR Enrichment
- Threat Intel (Alien Vault Provided)
- GEO IP Lookup
- Data Parsing
- Logstash Pipeline is stored in the folder structure. It includes Parsers for Audit and Provisioner.

------------
## Ping Federate
- Ping Fed ships logs on 2 different SYSLOG PORTS, with a CUSTOM mapping. This enables Logstash to use it's CSV filter to parse the logs quickly and map them. This isn't the fastest way to do this but for demo's it's more than sufficent.

------------
## Ping Dev-Ops Included Documentation


## Server Profiles

Ping Identity Server Profiles are used to provide the configuration, data, environment details to Ping Identity Docker Images.

### Available Server Profiles

There are several Ping Identity Server Profiles available in the Ping Identity Github repositories. They are outlined in the table below.

| Server Profile | Description |
| :--- | :--- |
| [Getting Started](https://github.com/pingidentity/pingidentity-server-profiles/tree/master/getting-started) | Ping Identity products with basic install/config |
| [Baseline](https://github.com/pingidentity/pingidentity-server-profiles/tree/master/baseline) | Ping Identity products with full integration |
| [Simple Sync](https://github.com/pingidentity/pingidentity-server-profiles/tree/master/simple-sync) | DataSync server sync'ing between two PingDirectory trees |

### Playground Server Profiles

There is a Github Repository containing samples, experimental, training types of server profiles that may be created to help with examples and getting started projects. These are guaranteed to be documented as they are often one off examples of different concepts. Some of these products include:

| Server Profile | Description |
| :--- | :--- |
| [PingFed Cluster](https://github.com/pingidentity/server-profile-pingidentity-playground/tree/master/getting-started-pingfederate-cluster) | Configuring a PingFed cluster with admin/engine nodes |
| [PingOne for Customer](https://github.com/pingidentity/server-profile-pingidentity-playground/tree/master/pingone-cloud) | Use cases around PingOne for Customer |
