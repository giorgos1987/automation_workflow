#!/bin/bash


KEY=/root/.ssh/wrkrootuserrsa
LOGS=/home/workflow/dataflows/010ingestion/scripts/OEORGANICEPRINTS/CRON_scripts/logs

echo "start indexing for ORGEPRINTS at $(date)" >> ${LOGS}/cron_ingest.log


#Run the remotely indexing script

ssh -i $KEY user@83.212.115.164 '/home/user/scripts_cron/index_eprints.sh'



echo "indexing Done for ORGEPRINTS !Step step600indexing completed  at $(date)!" >> ${LOGS}/cron_ingest.log






exit;
