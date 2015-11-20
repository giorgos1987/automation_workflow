#!/bin/bash

#/home/workflow/dataflows/010ingestion/scripts/OEORGANICEPRINTS/CRON_scripts/step010ingestion.sh


SET=ORGEPRINTS
#oeorganiceprints
FORMAT=LOM
OAITARGET="http://aglr.agroknow.gr/organic-edunet/oai"
OAIFORMAT="oai_lom"
BASE=/home/workflow/dataflows/010ingestion/scripts/OEORGANICEPRINTS/CRON_scripts
LOGS=${BASE}/logs
ROOT=/home/workflow
HARVESTER=${ROOT}/java/harvester/harvesting.jar
JAVA=/usr/bin/java
OUTPUTDIR=${BASE}/1_ingested

for oaiset in aglr_collection_20
do
  echo "$(date) | START harvesting             |" ${set} >> ${LOGS}/cron_ingest.log
  ${JAVA} -jar ${HARVESTER} ${OAITARGET} ${OUTPUTDIR}/ ${OAIFORMAT} ${oaiset}
done
 echo "$(date) |Harvesting for ORGEPRINTS Done! Step010ingestion completed | ${SET} ${FORMAT}" >> ${LOGS}/cron_ingest.log #~/cron_ingest.log


exit;
