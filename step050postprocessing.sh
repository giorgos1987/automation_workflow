#!/bin/bash

SET=oeorganiceprints
ROOT=/home/workflow
METADATA=${ROOT}/dataflows/010ingestion/metadata
LOGS=/home/workflow/dataflows/010ingestion/scripts/OEORGANICEPRINTS/CRON_scripts/logs
INPUTDIR=/home/workflow/dataflows/010ingestion/scripts/OEORGANICEPRINTS/CRON_scripts/4_transformed
#=${METADATA}/040transformed/${SET}
OUTPUTDIR=/home/workflow/dataflows/010ingestion/scripts/OEORGANICEPRINTS/CRON_scripts/5_postprocessed
#=${METADATA}/050postprocessed/${SET}



echo "$(date) Start  Transfering json files to dir 5_postprocessed!|oeorganiceprints" >> ${LOGS}/cron_workflow.txt

for akif in ${INPUTDIR}/*.json
do
  mv ${akif} ${OUTPUTDIR}/
done
echo "$(date) Transfer Done for step step050postprocessing!|oeorganiceprints" >> ${LOGS}/cron_workflow.txt

exit;
