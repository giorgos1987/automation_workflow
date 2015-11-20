# at /var/spool/cron/crontabs/workflow

51,52,53 * * * * /bin/sh /home/workflow/dataflows/010ingestion/scripts/OEORGANICEPRINTS/test_write.sh  > /dev/null 2>&1

######################################3 Start workflow for OrganicEprints ##########################################################
#run on 16 day of every month at 5 a.m->changed to 15:00
#8 15 16 * * /bin/sh /home/workflow/dataflows/010ingestion/scripts/OEORGANICEPRINTS/test_write.sh  > /dev/null 2>&1


#ingestion
#8 15 16 * * /bin/sh /home/workflow/dataflows/010ingestion/scripts/OEORGANICEPRINTS/CRON_scripts/step010ingestion.sh > /dev/null 2>&1

#simple transfer
#20 15 16 * * /bin/sh /home/workflow/dataflows/010ingestion/scripts/OEORGANICEPRINTS/CRON_scripts/step020filtering.sh > /dev/null 2>&1

#identify  duplicates
#28 15 16 * * /bin/sh /home/workflow/dataflows/010ingestion/scripts/OEORGANICEPRINTS/CRON_scripts/step030identification.sh > /dev/null 2>&1

#transform lom to akif
#35 15 16 * * /bin/sh /home/workflow/dataflows/010ingestion/scripts/OEORGANICEPRINTS/CRON_scripts/step040transformation.sh > /dev/null 2>&1

#transfering json files to 5_postprocessed
#45 15 16 * * /bin/sh /home/workflow/dataflows/010ingestion/scripts/OEORGANICEPRINTS/CRON_scripts/step050postprocessing.sh > /dev/null 2>&1

#transfering json files to remote server
#50 16 16 * * /bin/sh /home/workflow/dataflows/010ingestion/scripts/OEORGANICEPRINTS/CRON_scripts/step500publication.sh > /dev/null 2>&1

#indexing files
#5 16 16 * * /bin/sh /home/workflow/dataflows/010ingestion/scripts/OEORGANICEPRINTS/CRON_scripts/step600indexing.sh > /dev/null 2>&1
########################################3overall time:1h40min at least################################################################
