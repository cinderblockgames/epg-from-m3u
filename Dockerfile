FROM node:21-alpine

COPY . ./

RUN npm install && \
    chmod +x ./docker-start.sh

ENV M3U_FILE=/host/ita.m3u
ENV GUIDE_FILE=/host/guide.xml

EXPOSE 3000

CMD ./docker-start.sh
