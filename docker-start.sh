#!/bin/sh

# get channels from m3u
channels=$(grep -Eo 'tvg-id="([^"]+)"' $M3U_FILE | grep -Eo '"([^"]+)"' | tr -d '"')

# put together channels.xml
echo '<?xml version="1.0" encoding="UTF-8"?>' > $GUIDE_FILE
echo '<channels>' >> $GUIDE_FILE

  # this can't be efficient
for channel in $channels; do cat ./sites/*/*.channels.xml | grep $channel >> $GUIDE_FILE; done

echo '</channels>' >> $GUIDE_FILE

# deduplicate channels.xml
awk '!a[$0]++' $GUIDE_FILE > $GUIDE_FILE

# start epg
npm run grab -- --channels=$GUIDE_FILE --cron="0 0 * * *" &
npm run serve
