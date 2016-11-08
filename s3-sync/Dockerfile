FROM alpine:3.4

RUN apk update

# Set the correct timezone so that cronjobs run when expected
RUN apk add tzdata && \
    ln -sf /usr/share/zoneinfo/Europe/Oslo /etc/localtime

# Install AWS cli
RUN apk add python3 && \
    pip3 install awscli

# Set up app dir
RUN mkdir /app
WORKDIR /app
COPY . /app

# Install crontab
RUN crontab /app/crontab
CMD ["crond", "-f"]
