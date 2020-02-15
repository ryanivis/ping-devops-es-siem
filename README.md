# Ping Stack with ElasticSearch SIEM
#### Built by Ryan Ivis with Ping Identity

------------

Configure .env file in root directory first!
------------
`COMPOSE_PROJECT_NAME=es`
`ELASTIC_VERSION=7.6.0`
`ELASTIC_SECURITY=true`
`ELASTIC_PASSWORD=2FederateM0re`
`CERTS_DIR=/usr/share/elasticsearch/config/certificates`
`KIB_CERTS_DIR=/usr/share/kibana/config/certificates`
`PING_IDENTITY_DEVOPS_USER={YOUR DEVOPS USER NAME HERE}`
`PING_IDENTITY_DEVOPS_KEY={YOUR DEVOPS KEY HERE}`

------------

Configure your local docker client with at least 8GB Ram and 4CPU.
Go get'em cowboy/girl!!!

This will spin up a demo lab for Ping Fed / Directory / etc images.
Along with a ElasticSearch 2 Node Stack + Kibana + Logstash.

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
