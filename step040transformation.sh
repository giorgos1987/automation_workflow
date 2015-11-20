#!/bin/bash

export ZETTA_LANGUAGE_PROFILE_FOLDER=/home/workflow/java/nsdl2akif/profiles

FORMAT="LOM"
SET=ORGEPRINTS
#oeorganiceprints
ROOT=/home/workflow
METADATA=${ROOT}/dataflows/010ingestion/metadata
TRANSFORMER=${ROOT}/java/lom2akif/lom2akif.jar
JAVA=/usr/bin/java
INPUTDIR=/home/workflow/dataflows/010ingestion/scripts/OEORGANICEPRINTS/CRON_scripts/3_identified
LOGS=/home/workflow/dataflows/010ingestion/scripts/OEORGANICEPRINTS/CRON_scripts/logs

#INPUTDIR=${METADATA}/030identified/${FORMAT}/${SET}
#OUTPUTDIR=${METADATA}/040transformed/${SET}
OUTPUTDIR=/home/workflow/dataflows/010ingestion/scripts/OEORGANICEPRINTS/CRON_scripts/4_transformed
BADDIR=/home/workflow/dataflows/010ingestion/scripts/OEORGANICEPRINTS/CRON_scripts/41_rejected
#BADDIR=${METADATA}/041rejected/${FORMAT}/${SET}


echo "Start transforming ${SET} at $(date)"  >>  ${LOGS}/cron_ingest.log
${JAVA} -jar ${TRANSFORMER} ${INPUTDIR} ${OUTPUTDIR} ${BADDIR} ${SET}
echo "$(date) | Transformation Done for $(SET) | $(FORMAT)!" >>  ${LOGS}/cron_ingest.log
echo "===============================" >>  ${LOGS}/cron_ingest.log


exit;
