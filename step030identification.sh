#!/bin/bash

SET="ORGEPRINTS"
FORMAT="LOM"
ROOT=/home/workflow

BASE=/home/workflow/dataflows/010ingestion/scripts/OEORGANICEPRINTS/CRON_scripts
LOGS=${BASE}/logs


METADATA=${ROOT}/dataflows/010ingestion/metadata
INPUTDIR=${BASE}/2_filtered
OUTPUTDIR=${BASE}/3_identified
DUPLICATEDIR=${BASE}/3_dublicate
SUSPICIOUSDIR=${BASE}/3_suspicious
IDENTIFIER=${ROOT}/java/identifier/LOMParser.jar
JAVA=/usr/bin/java
DB="jdbc:mysql://localhost:3306/id_service?user=root&password=admin"

echo "$(date) | step030identification  Identifying " ${SET} >>  ${LOGS}/cron_ingest.log

${JAVA} -jar ${IDENTIFIER} ${INPUTDIR} ${OUTPUTDIR} ${DUPLICATEDIR} ${SUSPICIOUSDIR} ${FORMAT} ${DB}

echo "$(date) | Identification ${SET} Done! | ${FORMAT}" >>  ${LOGS}/cron_ingest.log #   ~/cron_ingest.log

echo "        |start coping xml files from dublicate folder to identified" >>  ${LOGS}/cron_ingest.log


for i in ${DUPLICATEDIR}/*oai_aglr.agroknow.gr.organic-edunet._*.xml
do
 mv "$i" "${DUPLICATEDIR}/${i/*oai_aglr.agroknow.gr.organic-edunet._/}" #Please note the duplicatedir as path requred
done

 find ${DUPLICATEDIR} -name "[0-9]*.xml" -type f > ${BASE}/list  #-exec echo > list {} \;

 mv  ${BASE}/list  ${BASE}/list_previous

###This replaces the identified
for i in `cat list`; do cp "$i" "${OUTPUTDIR}" ; done
###This prevents from copy to identified
##for i in `cat list`; do cp -rn "$i" "${OUTPUTDIR}" ; done

echo "$(date) |done copying files to identified folder" >>  ${LOGS}/cron_ingest.log

for file in ${DUPLICATEDIR}/*_item.xml
do
  mv $file ${file/_item.xml/.xml}
done
