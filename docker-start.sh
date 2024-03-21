#!/bin/sh

# get channels from m3u
channels=$(grep -Eo 'tvg-id="([^"]+)"' $M3U_FILE | grep -Eo '"([^"]+)"' | tr -d '"')

# put together channels.xml
echo '<?xml version="1.0" encoding="UTF-8"?>' > $CHANNELS_FILE
echo '<channels>' >> $CHANNELS_FILE

  # this can't be efficient
for channel in $channels; do cat ./sites/*/*.channels.xml | grep $channel >> $CHANNELS_FILE; done

echo '</channels>' >> $CHANNELS_FILE

# deduplicate channels.xml
#awk '!a[$0]++' $CHANNELS_FILE > $CHANNELS_FILE

# start epg
npm run grab -- --channels=$CHANNELS_FILE --output=$GUIDE_FILE --cron="0 0 * * *" &
npm run serve --host 0.0.0.0
