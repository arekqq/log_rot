#!/bin/bash
SCIEZKA="/home/arek/Obrazy/dew/cleanup-robot/tests"
find "$SCIEZKA" -iname '*.log' -or -name 'app.output' -size +1M > $SCIEZKA/spis_plikow
for i in $(cat $SCIEZKA/spis_plikow); 
do
	APP=$(echo "$i" | cut -d "/" -f 8)
	cp "$i" "${i}_$(date +%Y%m%d)"
	bzip2 "${i}_$(date +%Y%m%d)"
	mkdir -p "$APP/ftp/log_rotation"
	mv "${i}_$(date +%Y%m%d).bz2" "$APP/ftp/log_rotation"
	echo "${i}_$(date +%Y%m%d).bz2"
	echo "" > "$i"
done;