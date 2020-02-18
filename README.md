# Ping Stack with ElasticSearch SIEM
#### Built by Ryan Ivis with Ping Identity

This project is being used to build out a side-car demo 'SIEM' that will consume ping logs and provide pre-canned dashboards. It is under active development.  

THIS IS NOT INTENDED FOR PRODUCTION. THERE ARE DEFAULT PASSWORDS THAT MUST BE MODIFIED.  


Demo Ping Fed Dashboard
![alt text](https://github.com/ryanivis/ping-devops-es-siem/blob/master/images/dashboard.png "PingFed Demo Dashboard")

 
Threat Intel and TOR Endpoints are being provided by AlienVault and the TOR Network Endpoint List.
Threat Feeds are updated every 2000 seconds!!!

![alt text](https://github.com/ryanivis/ping-devops-es-siem/blob/master/images/Architecture.png "Architecture Overview")
------------
## Directions

- Clone this project to your local disk.  
- Configure .env file in root path of the clone and place these lines in it (update your devops details).      
------------
`COMPOSE_PROJECT_NAME=es`   
`ELASTIC_VERSION=7.6.0`  
`ELASTIC_SECURITY=true`  
`ELASTIC_PASSWORD=2FederateM0re`  
`CERTS_DIR=/usr/share/elasticsearch/config/certificates`  
`PING_IDENTITY_DEVOPS_USER={YOUR DEVOPS USER NAME HERE}`  
`PING_IDENTITY_DEVOPS_KEY={YOUR DEVOPS KEY HERE}` 
------------
- Configure Docker to have 8GB RAM and 4CPU  
- Start the stack with 'docker-compose up -d'   



Important Notes
- Do not update the above elastic password without first updating the same password within the logstash pipeline as well as bootstraping scripts.   for elasticsearch found in the corrisponding sub folders.   


- Configure your local docker client with at least 8GB Ram and 4CPU.  
- Go get'em cowboy/girl!!!  

- This will spin up a demo lab for Ping Fed / Directory / etc images.  
- Along with a ElasticSearch 2 Node Stack + Kibana + Logstash.  

------------
## Kibana Saved Objects
- Saved Objects can be loaded by going to 'saved objects' under kibana settings and exporting all. Save the file in the...  
- ./elasticsearch-siem/kibana_config/kib_base.ndjson.  

- They will be reloaded upon Kibana Start!!!  

------------


# Server Profiles

Ping Identity Server Profiles are used to provide the configuration, data, environment details to Ping Identity Docker Images.

## Available Server Profiles

There are several Ping Identity Server Profiles available in the Ping Identity Github repositories. They are outlined in the table below.

| Server Profile | Description |
| :--- | :--- |
| [Getting Started](https://github.com/pingidentity/pingidentity-server-profiles/tree/master/getting-started) | Ping Identity products with basic install/config |
| [Baseline](https://github.com/pingidentity/pingidentity-server-profiles/tree/master/baseline) | Ping Identity products with full integration |
| [Simple Sync](https://github.com/pingidentity/pingidentity-server-profiles/tree/master/simple-sync) | DataSync server sync'ing between two PingDirectory trees |

## Playground Server Profiles

There is a Github Repository containing samples, experimental, training types of server profiles that may be created to help with examples and getting started projects. These are guaranteed to be documented as they are often one off examples of different concepts. Some of these products include:

| Server Profile | Description |
| :--- | :--- |
| [PingFed Cluster](https://github.com/pingidentity/server-profile-pingidentity-playground/tree/master/getting-started-pingfederate-cluster) | Configuring a PingFed cluster with admin/engine nodes |
| [PingOne for Customer](https://github.com/pingidentity/server-profile-pingidentity-playground/tree/master/pingone-cloud) | Use cases around PingOne for Customer |
