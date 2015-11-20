#!/bin/bash

#~/dataflows/010ingestion/scripts

FORMAT="LOM"
SET="ORGEPRINTS"
ROOT=/home/workflow
BASE=/home/workflow/dataflows/010ingestion/scripts/OEORGANICEPRINTS/CRON_scripts
METADATA=/home/workflow/dataflows/010ingestion/metadata
LOGS=${BASE}/logs

INPUTDIR=${BASE}/1_ingested
OUTPUTDIR=${BASE}/2_filtered


 echo "$(date) | START step020filtering | ${SET} ${FORMAT}" >>  ${LOGS}/cron_ingest.log #~/cron_ingest.log

for lom in ${INPUTDIR}/*.xml
do
  cp  ${lom} ${OUTPUTDIR}/
done

 echo "$(date) | Filtering Done for OEORGANICEPRINTS/! | LOM" >>  ${LOGS}/cron_ingest.log #~/cron_ingest.log

exit;
