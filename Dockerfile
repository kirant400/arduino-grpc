FROM alpine:3.7

# Install latest arduino-cli

RUN apk add curl \
    && curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | BINDIR=/usr/bin sh

EXPOSE 50051
EXPOSE 9090

ENTRYPOINT ["arduino-cli","daemon"]
