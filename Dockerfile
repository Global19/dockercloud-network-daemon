FROM alpine

ENV VERSION 0.10.0

RUN ["apk", "add", "--update", "ethtool", "conntrack-tools", "curl", "iptables", "iproute2", "util-linux"]
ADD weave-daemon /
RUN chmod +x weave-daemon
ENV WEAVE_DOCKER_ARGS="-e LOGSPOUT=ignore"
ADD weave /
ADD run.sh /
ENTRYPOINT ["/run.sh"]
