# This template can be used as a starting point to create new Docker tools.
# It provides us with MicroBadger-compatible LABELS to view.
# For example on https://microbadger.com/images/mskcc/bwa_mem
#
# Please fill out all sections indicated with <xxxx>.
# Some steps are specific to java, and will differ from tool to tool.


FROM openjdk:8


ARG BUILD_DATE
ARG BUILD_VERSION
ARG LICENSE="Apache-2.0"
ARG <tool>_VERSION=8


LABEL org.opencontainers.image.vendor="MSKCC"
LABEL org.opencontainers.image.authors="<Your Name> (<your_email>@mskcc.org)"

LABEL org.opencontainers.image.created= \
	org.opencontainers.image.version= \
	org.opencontainers.image.licenses= \
	org.opencontainers.image.version.<tool>=${<tool>_VERSION} \
	org.opencontainers.image.source.<tool>="https://github.com/mskcc/<tool>/releases/"

LABEL org.opencontainers.image.description="This container uses <tool> version ${<tool>_VERSION}"


WORKDIR /usr/src

RUN apt-get update && \
	apt-get --no-install-recommends install -y \
	wget && \
	apt-get clean autoclean && \
	apt-get autoremove -y && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget "https://github.com/<tool_author>/<tool>/releases/download/v${<tool>_VERSION}/<tool>" && \
	chmod 755 /usr/src/<tool>.jar && \
    cp -s /usr/src/<tool>-${<tool>_VERSION}.jar /usr/local/bin/<tool>.jar
