#!/bin/bash

LOGS=/home/workflow/dataflows/010ingestion/scripts/OEORGANICEPRINTS/CRON_scripts/logs

KEY=/root/.ssh/wrkrootuserrsa
##ommite steps  step100lompublishing.sh step100lompublishing.sh
FROM=/home/workflow/dataflows/010ingestion/scripts/OEORGANICEPRINTS/CRON_scripts/5_postprocessed
#/home/workflow/dataflows/010ingestion/scripts/OEORGANICEPRINTS/CRON_scripts/6_lom_transformed
TO=/home/user/setup/AKIF/testcron




echo "$(date) Start Transfering json files to remote server|OEORGANICEPRINTS" >> $LOGS/cron_ingest.log

#ssh -i $KEY user@83.212.115.164 |
scp -i $KEY -r $FROM/* user@83.212.115.164:/home/user/setup/AKIF/testcron



echo "$(date) Files Transfering Done!Step step500publication.sh completed|OEORGANICEPRINTS" >> $LOGS/cron_ingest.log






exit;
