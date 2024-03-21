#!/bin/sh

# get channels from m3u


# put together channels.xml


# start epg
npm run grab -- --channels=./channels.xml --cron="0 0 * * *" &
npm run serve
