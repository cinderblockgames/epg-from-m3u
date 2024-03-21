FROM node:21-alpine

COPY * .

RUN npm install && \
    chmod +x ./docker-start.sh

ENV M3U_FILE=/host/m3u/playlist.m3u

EXPOSE 3000

CMD ./docker-start.sh
