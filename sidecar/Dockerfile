FROM busybox
ENV LANG=C.UTF-8
RUN set -eux && mkdir -p /usr/arex/agent
ADD ./arex-agent-*.jar /usr/arex/agent/
WORKDIR /