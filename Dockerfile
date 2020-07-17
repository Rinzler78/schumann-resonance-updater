#Download base image ubuntu 16.04
FROM alpine:latest

# Install open-ssh server, Wget
RUN apk update && apk upgrade && apk add wget

# # Volume configuration
RUN mkdir /history
VOLUME ["/history"]

# Cron part
ADD crontab.txt /crontab.txt

# Update script
ADD update.sh /update.sh

# Start script
ADD start.sh /start.sh

RUN chmod 755 /update.sh /start.sh
RUN /usr/bin/crontab /crontab.txt

CMD ["/start.sh"]