#!/usr/bin/env bash

echo "##Creating HTML Report##"
docker exec -i jm_master /bin/bash -c "cd /home/jmeter/ && jmeter -g /home/jmeter/jmeter-${GO_PIPELINE_COUNTER}.jtl -e -o /home/jmeter/htmlreport-${GO_PIPELINE_COUNTER}/"

echo "##Copying JTL and HTML Report to GOCD working DIR##"
# cd jm
echo "Current Working DIR is:$PWD"
docker cp jm_master:/home/jmeter/jmeter-${GO_PIPELINE_COUNTER}.jtl ./Report-${GO_PIPELINE_COUNTER}/jmeter-${GO_PIPELINE_COUNTER}.jtl
docker cp jm_master:/home/jmeter/htmlreport-${GO_PIPELINE_COUNTER}/ ./Report-${GO_PIPELINE_COUNTER}/htmlreport-${GO_PIPELINE_COUNTER}/

##> /dev/null && cat /home/jmeter/jmeter${GO_PIPELINE_COUNTER}.jtl' > test/jmeter${GO_PIPELINE_COUNTER}jtl
echo "Check Copied Report files on GOCD Agent Report DIR"
ls -lrt Report-${GO_PIPELINE_COUNTER}