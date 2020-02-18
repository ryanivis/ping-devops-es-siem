#!/usr/bin/python

#Author: Ryan Ivis
#Pull Down Tor Nodes / AlienVault Feeds and convert to YAML for Logstash Enrichment

import urllib2, re

def writeYAML_TOR(url, enrichmentFilePath):
        torNodes = urllib2.urlopen(url)
        rawContent = torNodes.text
        lineContent = rawContent.splitlines()

        if lineContent:
                yamlFile = open(enrichmentFilePath, 'w+')
                for line in lineContent:
                        if line.startswith("ExitAddress"):
                                splitLine = line.split(" ")
                                yamlFile.write("\"" + splitLine[1] + "\": \"YES\"" + "\n")
                yamlFile.close()


def writeYAML_AV(url, enrichmentFilePath):
        yamlFile = open(enrichmentFilePath, 'w')
        html = urllib2.urlopen(url)
        for line in html.readlines():
                line = re.sub('\\r|\\n','',line)
                newLine=line.split(' ', 1)[0]
                yamlFile.write("\"" + newLine + "\": \"YES\"" + "\n")
        yamlFile.close()


#Start Script
torFeedURL = "https://check.torproject.org/exit-addresses"
alienvaultFeedURL = "https://reputation.alienvault.com/reputation.generic"

enrichmentFilePath_TOR = "/etc/stash_enrichment/enrichment_cache/TorNodes.yml"
enrichmentFilePath_AV = "/etc/stash_enrichment/enrichment_cache/AlienVaultIP.yml"

writeYAML_TOR(torFeedURL, enrichmentFilePath_TOR)
writeYAML_AV(alienvaultFeedURL, enrichmentFilePath_AV)