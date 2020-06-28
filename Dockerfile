FROM ubuntu:18.04

RUN apt-get update && apt-get install -y unzip curl

# Modify this to match your local user's UID + GID
RUN addgroup --gid 1004 minecraft
RUN adduser --home /minecraft --uid 1002 --gid 1004 minecraft
USER minecraft

WORKDIR /minecraft

CMD ./bedrock_server
