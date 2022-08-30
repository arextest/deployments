FROM busybox:latest
ENV LANG=C.UTF-8
RUN set -eux && mkdir -p /usr/arex/agent
ADD ../agent/arex-agent-*.jar /usr/arex/agent
WORKDIR /