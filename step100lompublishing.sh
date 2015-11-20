#!/bin/bash

OESET=oeorganiceprints
SET=OEORGANICEPRINTS
ROOT=/home/workflow
METADATA=${ROOT}/dataflows/010ingestion/metadata
/home/workflow/dataflows/010ingestion/scripts/OEORGANICEPRINTS/CRON_scripts/logs

TRANSFORMER=${ROOT}/java/akif2lom/akif2lom.jar
JAVA=/usr/bin/java
INPUTDIR=/home/workflow/dataflows/010ingestion/scripts/OEORGANICEPRINTS/CRON_scripts/5_postprocessed
#=${METADATA}/060available/${OESET}
OUTPUTDIR=/home/workflow/dataflows/010ingestion/scripts/OEORGANICEPRINTS/CRON_scripts/6_lom_transformed
#=${ROOT}/repository/LOM/${SET}

echo "transforming ${SET}" >> ${LOGS}/cron_ingest.log
${JAVA} -jar ${TRANSFORMER} ${INPUTDIR} ${OUTPUTDIR}
echo "transforming akifTolom Done at $(date)!" >> ${LOGS}/cron_ingest.log
