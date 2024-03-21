#!/bin/sh

# get channels from m3u
channels=$(rep -Eo 'tvg-id="([^"]+)"' $M3U_FILE | grep -Eo '"([^"]+)"' | tr -d '"')

# put together channels.xml
echo '<?xml version="1.0" encoding="UTF-8"?>' > ./channels.xml
echo '<channels>' >> ./channels.xml

# this can't be efficient
cat ./sites/*/*.channels.xml | grep $channels > ./channels.xml

echo '</channels>' >> ./channels.xml

# start epg
npm run grab -- --channels=./channels.xml --cron="0 0 * * *" &
npm run serve
