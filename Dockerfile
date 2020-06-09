FROM alpine:3.7

# Install latest arduino-cli
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
RUN apk add curl \
    && curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | BINDIR=/usr/bin sh

EXPOSE 50051
EXPOSE 9090
# Tell docker that all future commands should run as the appuser user
USER appuser
ENTRYPOINT ["arduino-cli","daemon"]
