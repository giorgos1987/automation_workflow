#!/bin/bash

###########
########### dir /home/user/scripts_cron
###########


INDEXER_RUNTIME=/home/user/setup/elastic/indexer_runtime
JAVA=/usr/bin/java
DIR_AKIF=/home/user/setup/AKIF/TESTCRON
INDEXER=agro-indexer-1.0-SNAPSHOT.jar
#/home/user/setup/JAVA/agdataplatform/agro-indexer/target
#/home/user/setup/JAVA/agdataplatform/agro-indexer/target/
#/home/user/setup/JAVA/agdataplatform/agro-indexer/target
#/home/manolisn/agro-indexer-1.0-SNAPSHOT.jar
FORMAT=akif

echo "Indexing START  at $(date)" >> /home/user/scripts_cron/index.log


${JAVA} -jar ${INDEXER} --bulk-size 1000 --root-directory ${DIR_AKIF} --runtime-directory ${INDEXER_RUNTIME} --file-format ${FORMAT}

echo "Indexing DONE  at $(date)" >> /home/user/scripts_cron/index.log


exit;
