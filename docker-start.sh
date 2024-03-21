#!/bin/sh

# get channels from m3u
channels=$(rep -Eo 'tvg-id="([^"]+)"' $M3U_FILE | grep -Eo '"([^"]+)"' | tr -d '"')

# put together channels.xml


# start epg
npm run grab -- --channels=./channels.xml --cron="0 0 * * *" &
npm run serve
